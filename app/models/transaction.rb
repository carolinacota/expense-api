class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :category, presence: true
  validates :currency, presence: true
  validates :value, presence: true
end
