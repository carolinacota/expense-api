json.categories do
  json.array! @categories do |category|
    json.extract! category, :id, :name
    json.extract! category, :color
  end
end
