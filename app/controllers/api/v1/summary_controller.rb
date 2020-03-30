class Api::V1::SummaryController < Api::V1::BaseController
  def index

    transactions = Transaction.all
    @total_by_month = transactions.group_by{ |t| t.paid_on.month}

    # @monthly_sum = @total_by_month.sum(:price_cents)
    # .order("month DESC")
  end
end
