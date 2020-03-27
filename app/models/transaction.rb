class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user


  monetize :price_cents, with_model_currency: :currency

  validates :category, presence: true
  # validates :currency, presence: true
  validates :price_cents, presence: true
end
