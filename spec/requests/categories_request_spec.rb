require "rails_helper"

RSpec.describe "Categories management" do
  describe "GET #index" do
    it "uses authorized scope" do
      sign_in

      expect { get categories_path }.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
    end

    it "requires login" do
      expect { get categories_path }.to require_login
    end
  end

  describe "GET #new" do
    it "requires login" do
      expect { get new_category_path }.to require_login
    end
  end

  describe "GET #edit" do
    it "authorizes category" do
      sign_in

      category = create(:category)

      expect { get edit_category_path(category.id) }.to be_authorized_to(:update?, category)
    end

    it "requires login" do
      category = create(:category)

      expect { get edit_category_path(category.id) }.to require_login
    end
  end

  describe "POST #create" do
    it "requires login" do
      expect { post categories_path }.to require_login
    end
  end

  describe "PUT #update" do
    it "authorizes category" do
      sign_in

      category = create(:category)

      expect { put category_path(category.id) }.to be_authorized_to(:update?, category)
    end

    it "requires login" do
      category = create(:category)

      expect { put category_path(category.id) }.to require_login
    end
  end

  describe "DELETE #destroy" do
    it "authorizes category" do
      sign_in

      category = create(:category)

      expect { delete category_path(category.id) }.to be_authorized_to(:destroy?, category)
    end

    it "requires login" do
      category = create(:category)

      expect { delete category_path(category.id) }.to require_login
    end
  end
end
