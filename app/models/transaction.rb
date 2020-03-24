class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  # monetize: :value, as: "price", with_model_currency: :currency

  validates :category, presence: true
  validates :currency, presence: true
  validates :value, presence: true
end
