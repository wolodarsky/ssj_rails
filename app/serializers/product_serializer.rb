class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_number, :description, :primary_photo_id
end
