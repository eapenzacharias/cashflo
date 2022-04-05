class TransactionsController < ApplicationController
  before_action :authenticate_user!

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
    @invoice = Invoice.new(name: invoice_params[:name], amount: invoice_params[:amount],
                           category_id: invoice_params[:category_id], user: current_user)
    if @invoice.save
      redirect_to category_path(invoice_params[:category_id]), success: 'Invoice added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @invoice = Invoice.find_by_id(params[:id])
    @categories = current_user.categories
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update(invoice_params.merge(user: current_user))
      flash[:success] = 'Invoice updated.'
      redirect_to categories_path
    else
      flash[:fail] = 'Updation unsucessful.'
    end
  end

  def destroy

  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :amount, :category_id)
  end
end
