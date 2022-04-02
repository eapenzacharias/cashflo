class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @head = 'Categories'
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by_id(params[:id])
    @invoices = @category.invoices
  end

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
