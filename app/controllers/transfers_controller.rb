class TransfersController < ApplicationController
  def new
    transfer = Transfer.new

    render new_page(transfer)
  end

  def create
    result = Transfers::Create.result(attributes: transfer_params)

    if result.success?
      redirect_to records_path, success: t(".success")
    else
      render new_page(result.transfer), status: :unprocessable_entity
    end
  end

  private

  def new_page(transfer)
    Transfers::Pages::New.new(transfer: transfer, accounts: current_accounts)
  end

  def transfer_params
    params.require(:transfer).permit(:from_account_id, :to_account_id, :amount_cents, :occurred_on, :description).to_h
  end
end
