class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates_presence_of :customer_id, :merchant_id, :status

  def self.total_invoices
    Invoice.count
  end

  def self.percent_pending
    (Invoice.where(status: 'pending').count.to_f / Invoice.total_invoices * 100).round
  end

  def self.percent_shipped
    (Invoice.where(status: 'shipped').count.to_f / Invoice.total_invoices * 100).round
  end

  def self.percent_returned
    (Invoice.where(status: 'returned').count.to_f / Invoice.total_invoices * 100).round
  end

  def self.highest_price
    highest_price = Invoice.all.max_by do |invoice|
      invoice.invoice_items.maximum(:unit_price)
    end
    highest_price.id
  end

  def self.lowest_price
    lowest_price = Invoice.all.min_by do |invoice|
      invoice.invoice_items.minimum(:unit_price)
    end
    lowest_price.id
  end

end
