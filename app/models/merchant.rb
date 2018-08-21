class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.last_updated
    maximum(:updated_at)
  end
end
