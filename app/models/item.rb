class Item < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :name, :description, :unit_price, :merchant_id, :image

  def self.last_updated
    maximum(:updated_at)
  end
end
