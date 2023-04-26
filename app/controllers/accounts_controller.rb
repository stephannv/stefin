class AccountsController < ApplicationController
  def index
    render Accounts::Pages::Index.new(accounts: current_accounts)
  end

  def new
    render Accounts::Pages::New.new(account: Account.new)
  end

  def edit
    authorize! account

    render Accounts::Pages::Edit.new(account: account)
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::Pages::New.new(account: result.account), status: :unprocessable_entity
    end
  end

  def update
    authorize! account

    result = Accounts::Update.result(id: account.id, attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::Pages::Edit.new(account: result.account), status: :unprocessable_entity
    end
  end

  def destroy
    authorize! account

    result = Accounts::Destroy.result(id: account.id)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      redirect_to edit_account_path(result.account), error: t(".error")
    end
  end

  private

  def account
    @account ||= Accounts::Find.result(id: params[:id]).account
  end

  def account_params
    params.require(:account).permit(:title, :color).to_h.merge(user_id: current_user.id)
  end
end
