json.array! @transactions do |transaction|
  json.extract! transaction, :id, :date, :currency, :value, :description, :category_id, :user_id
end
