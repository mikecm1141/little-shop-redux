class Invoice < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :customer_id, :merchant_id, :status
end
