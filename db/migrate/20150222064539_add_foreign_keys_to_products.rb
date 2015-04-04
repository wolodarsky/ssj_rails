class AddForeignKeysToProducts < ActiveRecord::Migration
  def change
    add_foreign_key :product_variants, :products, on_delete: :cascade
  end
end
