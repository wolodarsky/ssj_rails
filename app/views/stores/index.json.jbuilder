json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address_1, :address_2, :city, :state, :zipcode, :phone, :url
  json.url store_url(store, format: :json)
end
