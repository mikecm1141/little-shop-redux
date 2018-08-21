class InvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer  :item_id
      t.integer  :invoice_id
      t.integer  :quantity
      t.string    :unit_price

      t.timestamps null: false
    end
  end
end
