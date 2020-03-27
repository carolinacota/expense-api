json.extract! @transaction, :id, :paid_on, :price, :description, :user_id
json.category do
  json.name @transaction.category.name
  # json.color @transaction.category.color
end


# json.extract! @category, :id, :name, :color
# json.transactions @category.transaction do |transaction|
#   json.extract! transaction, :id, :paid_on, :currency, :value, :description, :category_id, :user_id
# end
