RSpec.describe Merchant,type: :model do
  describe 'Validations' do
    it 'should have many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
    it {should validate_presence_of(:name)}
  end
  describe 'Class Methods' do
    it '.last_updated' do
      merchant = Merchant.create(name: 'Test Merchant')
      last_updated = Merchant.last_updated

      expect(last_updated).to eq(merchant.updated_at)
    end
    it '.highest_priced_item' do
      merchant_1 = Merchant.create(name: 'Nick and Mike')
      merchant_2 = Merchant.create(name: 'Miriam Sells Stuff')
      item_1 = merchant_1.items.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = merchant_1.items.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      item_3 = merchant_2.items.create(name: 'Ranch Dressing', description: 'Fixes pizza', unit_price: "500", image: 'https://images-gmi-pmc.edge-generalmills.com/6baa2d3b-2beb-4875-9318-f7eee148c00b.jpg')
      item_4 = merchant_2.items.create(name: 'Grape Jelly', description: 'Grape Nation', unit_price: "700", image: 'https://www.seriouseats.com/recipes/images/2011/09/20110918preservedjamresaved.jpg')

      expect(merchant_1).to eq(Merchant.highest_priced_item)
    end

  end
  describe 'Instance Methods' do
    it '#item_totals' do
      merchant = Merchant.create(name: 'Test Merchant')
      item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      item_totals = merchant.merchant_item_count

      expect(item_totals).to eq(2)
    end
    it '#avg_price' do
      merchant = Merchant.create(name: 'Test Merchant')
      item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      item_averages = merchant.item_averages/100

      expect(item_averages).to eq(33.31)
    end
    it '#total_price' do
      merchant = Merchant.create(name: 'Test Merchant')
      item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      item_price_total = merchant.total_merchant_price/100

      expect(item_price_total).to eq(66.62)
    end
  end
end
