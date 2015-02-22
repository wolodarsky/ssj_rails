class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.hstore :options, null: true
      t.string :product_variant_number, null: false
      t.integer :primary_photo_id, index: true
      t.integer :product_id, null: false

      t.timestamps null: false
    end
  end
end
