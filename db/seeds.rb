require 'csv'
require './app/models/merchant'
require './app/models/item'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(
    id:         row[:id],
    name:       row[:name],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  )
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |row|
  Item.create(
    id:          row[:id],
    name:        row[:name],
    description: row[:description],
    unit_price:  row[:unit_price],
    merchant_id: row[:merchant_id],
    image:       "https://www.turing.io/sites/default/files/styles/graduate_full_profile/public/headshot-small.jpg?itok=bZoiM1y_",
    created_at:  row[:created_at],
    updated_at:  row[:updated_at]
  )
end
