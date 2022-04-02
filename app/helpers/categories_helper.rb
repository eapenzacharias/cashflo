module CategoriesHelper
  def category_sum(category)
    total_amount = category.invoices.sum(:amount)
    return "$ 0.00" if total_amount.zero?
    "$#{total_amount}"
  end
end
