class TransactionsController < ApplicationController
  def index; end

  def new
    @invoice = Invoice.new
    @categories = current_user.categories
  end

  def show; end
end
