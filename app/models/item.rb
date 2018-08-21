class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates_presence_of :name, :description, :unit_price, :merchant_id, :image

  def self.last_updated
    maximum(:updated_at)
  end

  def self.total_item_count
    Item.count
  end

  def self.average_price
    x = Item.average(:unit_price)
    (x / 100).round
  end

  def self.newest_item
    Item.order(created_at: :DESC).first.name
  end

  def self.oldest_item
    Item.order(created_at: :ASC).first.name
  end
end
