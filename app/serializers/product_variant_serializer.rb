class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :options,  :product_variant_number,  :primary_photo_id,  :product_id

  def options
    # AMS locking on hstore, returning the object to override
    object.options
  end
end
