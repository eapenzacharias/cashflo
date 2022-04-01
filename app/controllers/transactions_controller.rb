class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @invoice = Invoice.new
    @categories = current_user.categories
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

  def show; end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :amount, :category_id)
  end
end
