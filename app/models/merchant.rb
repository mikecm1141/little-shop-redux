class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.last_updated
    maximum(:updated_at)
  end

  def merchant_item_count
    items.count
  end

  def item_averages
    items.average(:unit_price).to_f
  end

  def total_merchant_price
    items.sum(:unit_price).to_f
  end

  def self.highest_priced_item
    select("merchants.*, max(unit_price) AS max_price").joins(:items).group(:merchant_id, :id).order("max_price DESC").first
  end

  def self.most_items
    select("merchants.*, count(items) AS item_count").joins(:items).group(:merchant_id, :id).order("item_count DESC").first
  end
end
