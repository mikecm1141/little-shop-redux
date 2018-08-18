class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :unit_price, :merchant_id, :image
end
