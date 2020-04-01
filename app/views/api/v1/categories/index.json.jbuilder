json.categories do
  json.array! @categories do |category|
    json.extract! category, :id, :name
    json.total category.sum_of_transactions_in_month_cents(@month, current_user)
  end
end
json.total @total
