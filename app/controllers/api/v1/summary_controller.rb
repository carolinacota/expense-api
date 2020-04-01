class Api::V1::SummaryController < Api::V1::BaseController
  before_action :authenticate_user!

  def index

    transactions = policy_scope(Transaction)
    @transactions_in_month = transactions.group_by{ |t| t.paid_on.beginning_of_month}
    @arr = []
    @transactions_in_month.each do |key, value|
      @arr << { month: key.month, year: key.year, total_cents: sum_transactions(value) }
      # @arr <<
      # { month: 1, year: 2020, total: 34500 }
    end
  end

  private

  def sum_transactions(transactions)
    sum = 0
    transactions.each do |t|
      sum += t.price_cents
    end
    return sum
  end
end
