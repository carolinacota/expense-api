class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy

  monetize :sum_of_transactions_cents, with_model_currency: :currency
  monetize :sum_of_transactions_in_month_cents, with_model_currency: :currency

  def sum_of_transactions_cents
    transactions.sum(:price_cents)
  end

  def sum_of_transactions_in_month_cents(month)
    transactions.where("EXTRACT(MONTH FROM paid_on) = ?", month)
                .sum(:price_cents)
  end
end
