class CategoriesController < ApplicationController
  def index
    result = Categories::List.result

    render Categories::Pages::Index.new(categories: result.categories)
  end

  def new
    render Categories::Pages::New.new(category: Category.new)
  end

  def edit
    result = Categories::Find.result(id: params[:id])

    render Categories::Pages::Edit.new(category: result.category)
  end

  def create
    result = Categories::Create.result(attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      puts "hello"
      render Categories::Pages::New.new(category: result.category), status: :unprocessable_entity
    end
  end

  def update
    result = Categories::Update.result(id: params[:id], attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      render Categories::Pages::Edit.new(category: result.category), status: :unprocessable_entity
    end
  end

  def destroy
    result = Categories::Destroy.result(id: params[:id])

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      redirect_to edit_category_path(result.category), error: t(".error")
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :color).to_h
  end
end
