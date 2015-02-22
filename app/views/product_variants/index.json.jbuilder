json.array!(@product_variants) do |product_variant|
  json.extract! product_variant, :id, :options, :product_variant_number, :primary_photo_id, :product_id
  json.url product_variant_url(product_variant, format: :json)
end
