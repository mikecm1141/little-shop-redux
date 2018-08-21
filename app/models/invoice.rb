class Invoice < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :customer_id, :merchant_id, :status

  def self.last_updated
    maximum(:updated_at)
  end
end
