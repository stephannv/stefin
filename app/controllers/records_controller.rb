class RecordsController < ApplicationController
  def index
    result = Records::List.result

    render Records::Pages::Index.new(records: result.records.to_a)
  end

  def new
    record = Record.new(group: RecordGroups::EXPENSE, occurred_on: Time.zone.today)

    render Records::Pages::New.new(record: record, accounts: accounts, categories: categories)
  end

  def edit
    result = Records::Find.result(id: params[:id])

    render Records::Pages::Edit.new(record: result.record, accounts: accounts, categories: categories)
  end

  def create
    result = Records::Create.result(attributes: record_params)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      new_page = Records::Pages::New.new(record: result.record, accounts: accounts, categories: categories)

      render new_page, status: :unprocessable_entity
    end
  end

  def update
    result = Records::Update.result(id: params[:id], attributes: record_params)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      edit_page = Records::Pages::Edit.new(record: result.record, accounts: accounts, categories: categories)

      render edit_page, status: :unprocessable_entity
    end
  end

  def destroy
    result = Records::Destroy.result(id: params[:id])

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      redirect_to edit_record_path(result.record), error: t(".error")
    end
  end

  private

  def accounts
    Accounts::List.result.accounts.to_a
  end

  def categories
    Categories::List.result.categories.to_a
  end

  def record_params
    params.require(:record).permit(
      :group, :account_id, :category_id, :amount_cents, :occurred_on, :payee, :description
    ).to_h
  end
end
