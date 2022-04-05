class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @head = 'Categories'
    @categories = current_user.categories
  end

  def new
    @category = Category.new
    @head = 'Add Category'
  end

  def show
    @category = Category.find_by_id(params[:id])
    @head = @category.name
    @invoices = @category.invoices.order(created_at: :desc)
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
