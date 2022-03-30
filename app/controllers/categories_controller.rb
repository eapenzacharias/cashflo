class CategoriesController < ApplicationController
  def index; end

  def new
    @category = Category.new
  end

  def show; end

  def create
    @category = Category.new(category_params.merge(user: current_user))
    if @category.save
      redirect_to categories_url, success: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
