json.array!(@products) do |product|
  json.extract! product, :id, :name, :model_number, :description, :primary_photo_id
  json.url product_url(product, format: :json)
end
