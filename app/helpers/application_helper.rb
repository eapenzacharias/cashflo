module ApplicationHelper
  def category_sum(invoices)
    total_amount = invoices.sum(:amount)
    return '$ 0.00' if total_amount.zero?

    "$#{total_amount}"
  end

  def last_month_sum(invoices)
    invoices = invoices.where('created_at BETWEEN ? AND ?', 30.days.ago, Time.now)
    total_amount = invoices.sum(:amount)
    return '$ 0.00' if total_amount.zero?

    "$#{total_amount}"
  end
end
