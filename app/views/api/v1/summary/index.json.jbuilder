# json.summary do
#   json.transactions @transactions_in_month
#   # json.total @arr
# end

json.summary do
  json.array! @arr do |summary|
    json.extract! summary, :month, :year, :total_cents
  end
end
