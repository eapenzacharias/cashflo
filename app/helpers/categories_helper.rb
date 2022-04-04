module CategoriesHelper
  def category_sum(category)
    total_amount = category.invoices.sum(:amount)
    return '$ 0.00' if total_amount.zero?

    "$#{total_amount}"
  end

  def last_month_sum(category)
    invoices = category.invoices.where('cutdate BETWEEN ? AND ?', Date.current, 30.days.from_now)
    total_amount = invoices.sum(:amount)
    return '$ 0.00' if total_amount.zero?

    "$#{total_amount}"
  end
end
