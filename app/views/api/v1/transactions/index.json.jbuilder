json.transactions do
  json.array! @transactions do |transaction|
    json.extract! transaction, :id, :paid_on, :price, :description, :user_id
    json.category do
      json.name transaction.category.name
      # json.color transaction.category.color
    end
  end
end

# json.categories do
#   json.array! @categories do |category|
#     json.extract! category, :id, :name
#   end
# end

