class ProductVariant < ActiveRecord::Base
  # store_accessor :options, :Color

  belongs_to :product
end
