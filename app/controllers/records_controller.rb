class RecordsController < ApplicationController
  def index
    result = Records::List.result(scope: records_scope)

    render Records::Pages::Index.new(records: result.records.to_a)
  end

  def new
    record = Record.new(group: RecordGroups::EXPENSE, occurred_on: Time.zone.today)

    render Records::Pages::New.new(record: record, accounts: accounts, categories: categories)
  end

  def edit
    authorize! record

    render Records::Pages::Edit.new(record: record, accounts: accounts, categories: categories)
  end

  def create
    authorize_related_data!

    result = Records::Create.result(attributes: record_params)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      new_page = Records::Pages::New.new(record: result.record, accounts: accounts, categories: categories)

      render new_page, status: :unprocessable_entity
    end
  end

  def update
    authorize! record
    authorize_related_data!

    result = Records::Update.result(id: record.id, attributes: record_params)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      edit_page = Records::Pages::Edit.new(record: result.record, accounts: accounts, categories: categories)

      render edit_page, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! record

    result = Records::Destroy.result(id: record.id)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      redirect_to edit_record_path(result.record), error: t(".error")
    end
  end

  private

  def records_scope
    authorized_scope(Record.all)
  end

  def record
    @record ||= Records::Find.result(id: params[:id]).record
  end

  def accounts
    scope = authorized_scope(Account.all, with: AccountPolicy)
    Accounts::List.result(scope: scope).accounts.to_a
  end

  def categories
    scope = authorized_scope(Category.all, with: CategoryPolicy)
    Categories::List.result(scope: scope).categories.to_a
  end

  def authorize_related_data!
    authorize! Accounts::Find.result(id: record_params[:account_id]).account, to: :show?
    authorize! Categories::Find.result(id: record_params[:category_id]).category, to: :show?
  end

  def record_params
    params.require(:record).permit(
      :group, :account_id, :category_id, :amount_cents, :occurred_on, :payee, :description
    ).to_h
  end
end
