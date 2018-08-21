class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  validates_presence_of :item_id, :invoice_id, :quantity, :unit_price
end
