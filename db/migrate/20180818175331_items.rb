class Items < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.string  :description
      t.float   :unit_price
      t.integer :merchant_id
      t.string  :image

      t.timestamps null: false
    end
  end
end
