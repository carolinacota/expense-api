class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  monetize :price_cents, with_model_currency: :currency

  validates :category, presence: true
  # validates :currency, presence: true
  validates :price_cents, presence: true

  # Class Method/ActiveRecord_Collection
  # Transaction.by_category(id), @transactions.by_category
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_month, ->(month) { where("EXTRACT(MONTH FROM paid_on) = ?", month) }

  def self.total_in_month(month)
    by_month(month).collect(&:price).sum
  end
end
