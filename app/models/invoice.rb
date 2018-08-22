class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates_presence_of :customer_id, :merchant_id, :status

  def invoice_total
    invoice_items.inject(0) do |sum, invoice_item|
      sum + invoice_item.unit_price.to_i * invoice_item.quantity
    end
  end

  def self.total_invoices
    count
  end

  def self.percent_pending
    (where(status: 'pending').count.to_f / total_invoices * 100).round
  end

  def self.percent_shipped
    (where(status: 'shipped').count.to_f / total_invoices * 100).round
  end

  def self.percent_returned
    (where(status: 'returned').count.to_f / total_invoices * 100).round
  end

  def self.highest_price
    joins(:invoice_items).order("invoice_items.unit_price DESC").limit(1).first
  end

  def self.lowest_price
    joins(:invoice_items).order("invoice_items.unit_price").limit(1).first

  end

  def self.highest_quantity
    InvoiceItem.select("invoice_items.*, sum(quantity) AS quantity_sum").joins(:item).group(:invoice_id, :id).order("quantity_sum DESC").limit(1).first
  end

  def self.lowest_quantity
    InvoiceItem.select("invoice_items.*, sum(quantity) AS quantity_sum").joins(:item).group(:invoice_id, :id).order("quantity_sum").limit(1).first
  end

  def self.last_updated
    maximum(:updated_at)
  end

end
