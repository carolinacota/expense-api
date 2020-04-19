json.categories do
  json.array! @categories do |category|
    total = category.sum_of_transactions_in_month_cents(@month, current_user)
    if (total > 0)
      json.extract! category, :id, :name, :color
      json.total category.sum_of_transactions_in_month_cents(@month, current_user)
    end
  end
end
json.total @total
