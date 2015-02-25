class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name,  :address_1,  :address_2,  :city, :state,  :zipcode,
             :phone,  :url, :created_at, :updated_at
end
