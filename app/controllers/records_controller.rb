class RecordsController < ApplicationController
  def index
    result = Records::List.result

    render Records::Pages::Index.new(records: result.records.to_a)
  end

  def new
    record = Record.new(group: RecordGroups::EXPENSE, occurred_on: Time.zone.today)

    render Records::Pages::New.new(record: record, accounts: accounts, categories: categories)
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

  private

  def accounts
    Accounts::List.result.accounts.to_a
  end

  def categories
    Categories::List.result.categories.to_a
  end

  def record_params
    params.require(:record).permit(:group, :account_id, :category_id, :amount_cents, :occurred_on, :description).to_h
  end
end
