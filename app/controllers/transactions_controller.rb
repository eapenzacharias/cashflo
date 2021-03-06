class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_categories

  def index
    @invoices = current_user.invoices.order(created_at: :desc)
    @head = 'All Invoices'
  end

  def new
    @invoice = Invoice.new
    @categories = current_user.categories
    @head = 'Add Invoice'
  end

  def create
    @invoice = Invoice.new(invoice_params.merge(user: current_user))
    if @invoice.save
      flash[:notice] = 'Invoice created.'
      redirect_to categories_path
    else
      flash[:fail] = 'Creation unsucessful'
      render :new
    end
  end

  def edit
    @head = 'Update Invoice'
    @invoice = Invoice.find_by_id(params[:id])
    @categories = current_user.categories
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update(invoice_params.merge(user: current_user))
      flash[:notice] = 'Invoice updated.'
      redirect_to categories_path
    else
      flash[:fail] = 'Updation unsucessful.'
    end
  end

  def destroy
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.destroy
      flash[:notice] = 'Invoice deleted.'
      redirect_to categories_path
    else
      flash[:fail] = 'Deletion unsucessful.'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :amount, :category_id)
  end

  def check_categories
    return unless current_user.categories.empty?

    flash[:warning] = 'Create a category first!'
    redirect_to new_category_path
  end
end
