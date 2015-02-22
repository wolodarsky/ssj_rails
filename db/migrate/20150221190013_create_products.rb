class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :model_number, null: false
      t.text :description, null: true
      t.integer :primary_photo_id

      t.timestamps null: false
    end
  end
end
