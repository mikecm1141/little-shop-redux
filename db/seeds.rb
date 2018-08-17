require 'csv'
require './app/models/merchant'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(
    id:         row[:id],
    name:       row[:name],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  )
end
