require "rails_helper"

RSpec.describe "Accounts management" do
  describe "GET #index" do
    it "uses authorized scope" do
      sign_in

      expect { get accounts_path }.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
    end

    it "requires login" do
      expect { get accounts_path }.to require_login
    end
  end

  describe "GET #new" do
    it "requires login" do
      expect { get new_account_path }.to require_login
    end
  end

  describe "GET #edit" do
    it "authorizes account" do
      sign_in

      account = create(:account)

      expect { get edit_account_path(account.id) }.to be_authorized_to(:update?, account)
    end

    it "requires login" do
      account = create(:account)

      expect { get edit_account_path(account.id) }.to require_login
    end
  end

  describe "POST #create" do
    it "requires login" do
      expect { post accounts_path }.to require_login
    end
  end

  describe "PUT #update" do
    it "authorizes account" do
      sign_in

      account = create(:account)

      expect { put account_path(account.id) }.to be_authorized_to(:update?, account)
    end

    it "requires login" do
      account = create(:account)

      expect { put account_path(account.id) }.to require_login
    end
  end

  describe "DELETE #destroy" do
    it "authorizes account" do
      sign_in

      account = create(:account)

      expect { delete account_path(account.id) }.to be_authorized_to(:destroy?, account)
    end

    it "requires login" do
      account = create(:account)

      expect { delete account_path(account.id) }.to require_login
    end
  end
end
