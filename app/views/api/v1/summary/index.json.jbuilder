json.summary do
  json.total @total_by_month
end

  # json.array! @total_by_month do |month|
  #   json.extract! transaction, :price_cents
# #     json.total category.sum_of_transactions_in_month_cents(@month)

  # end
