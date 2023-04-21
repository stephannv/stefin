require "rails_helper"

RSpec.describe "Records management" do
  describe "GET #index" do
    it "uses authorized scope" do
      sign_in

      expect { get records_path }.to have_authorized_scope(:active_record_relation).with(RecordPolicy)
    end

    it "requires login" do
      expect { get records_path }.to require_login
    end
  end

  describe "GET #new" do
    it "uses accounts authorized scope" do
      sign_in

      expect { get new_record_path }.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
    end

    it "uses categories authorized scope" do
      sign_in

      expect { get new_record_path }.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
    end

    it "requires login" do
      expect { get new_record_path }.to require_login
    end
  end

  describe "GET #edit" do
    it "authorizes record" do
      sign_in

      record = create(:record)

      expect { get edit_record_path(record.id) }.to be_authorized_to(:update?, record)
    end

    it "uses accounts authorized scope" do
      user = sign_in
      record = create(:record, user: user)

      expect { get edit_record_path(record.id) }.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
    end

    it "uses categories authorized scope" do
      user = sign_in

      record = create(:record, user: user)

      expect { get edit_record_path(record.id) }.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
    end

    it "requires login" do
      record = create(:record)

      expect { get edit_record_path(record.id) }.to require_login
    end
  end

  describe "POST #create" do
    it "authorizes related data" do
      user = sign_in

      account = create(:account, user: user)
      category = create(:category, user: user)

      expect do
        post records_path, params: {record: {account_id: account.id, category_id: category.id}}
      end.to(
        be_authorized_to(:show?, account)
        .and(be_authorized_to(:show?, category))
      )
    end

    it "requires login" do
      expect { post records_path }.to require_login
    end

    context "with invalid params" do
      it "uses accounts authorized scope" do
        user = sign_in

        account = create(:account, user: user)
        category = create(:category, user: user)

        expect do
          post records_path, params: {record: {account_id: account.id, category_id: category.id}}
        end.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
      end

      it "uses categories authorized scope" do
        user = sign_in

        account = create(:account, user: user)
        category = create(:category, user: user)

        expect do
          post records_path, params: {record: {account_id: account.id, category_id: category.id}}
        end.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
      end
    end
  end

  describe "PUT #update" do
    it "authorizes record" do
      sign_in

      record = create(:record)

      expect { put record_path(record.id) }.to be_authorized_to(:update?, record)
    end

    it "authorizes related data" do
      user = sign_in

      account = create(:account, user: user)
      category = create(:category, user: user)
      record = create(:record, user: user)

      expect do
        put record_path(record.id), params: {record: {account_id: account.id, category_id: category.id}}
      end.to(
        be_authorized_to(:show?, account)
        .and(be_authorized_to(:show?, category))
      )
    end

    it "requires login" do
      record = create(:record)

      expect { put record_path(record.id) }.to require_login
    end

    context "with invalid params" do
      it "uses accounts authorized scope" do
        user = sign_in

        account = create(:account, user: user)
        category = create(:category, user: user)
        record = create(:record, user: user)

        expect do
          put record_path(record.id), params: {record: {account_id: account.id, category_id: category.id, amount_cents: 0}}
        end.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
      end

      it "uses categories authorized scope" do
        user = sign_in

        account = create(:account, user: user)
        category = create(:category, user: user)
        record = create(:record, user: user)

        expect do
          put record_path(record.id), params: {record: {account_id: account.id, category_id: category.id, amount_cents: 0}}
        end.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
      end
    end
  end

  describe "DELETE #destroy" do
    it "authorizes record" do
      sign_in

      record = create(:record)

      expect { delete record_path(record.id) }.to be_authorized_to(:destroy?, record)
    end

    it "requires login" do
      record = create(:record)

      expect { delete record_path(record.id) }.to require_login
    end
  end
end
