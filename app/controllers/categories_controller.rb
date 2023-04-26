class CategoriesController < ApplicationController
  def index
    render Categories::Pages::Index.new(categories: current_categories)
  end

  def new
    render Categories::Pages::New.new(category: Category.new)
  end

  def edit
    authorize! category

    render Categories::Pages::Edit.new(category: category)
  end

  def create
    result = Categories::Create.result(attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      render Categories::Pages::New.new(category: result.category), status: :unprocessable_entity
    end
  end

  def update
    authorize! category

    result = Categories::Update.result(id: category.id, attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      render Categories::Pages::Edit.new(category: result.category), status: :unprocessable_entity
    end
  end

  def destroy
    authorize! category

    result = Categories::Destroy.result(id: category.id)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      redirect_to edit_category_path(result.category), error: t(".error")
    end
  end

  private

  def category
    @category ||= Categories::Find.result(id: params[:id]).category
  end

  def category_params
    params.require(:category).permit(:title, :color).to_h.merge(user_id: current_user.id)
  end
end
