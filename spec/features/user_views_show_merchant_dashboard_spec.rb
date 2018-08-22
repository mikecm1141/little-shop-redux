RSpec.describe 'Show Merchant Dashboard Page' do

  context 'Show Merchant Details' do
    it 'shows merchant details' do
      merchant_1 = Merchant.create(name: 'Nick and Mike')
      merchant_2 = Merchant.create(name: 'Miriam Sells Stuff')
      item_1 = merchant_1.items.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = merchant_1.items.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      item_3 = merchant_2.items.create(name: 'Ranch Dressing', description: 'Fixes pizza', unit_price: "500", image: 'https://images-gmi-pmc.edge-generalmills.com/6baa2d3b-2beb-4875-9318-f7eee148c00b.jpg')
      item_4 = merchant_2.items.create(name: 'Grape Jelly', description: 'Grape Nation', unit_price: "700", image: 'https://www.seriouseats.com/recipes/images/2011/09/20110918preservedjamresaved.jpg')

      visit '/merchants-dashboard'

      expect(page).to have_content(merchant_1.name)
      within("#merchant-item-count-#{merchant_1.id}") do
        expect(page).to have_content(merchant_1.merchant_item_count)
      end
      within("#merchant-item-count-#{merchant_2.id}") do
        expect(page).to have_content(merchant_2.merchant_item_count)
      end
      within("#merchant-average-price-#{merchant_1.id}") do
        expect(page).to have_content(merchant_1.item_averages/100)
      end
      within("#merchant-average-price-#{merchant_2.id}") do
        expect(page).to have_content(merchant_2.item_averages/100)
      end
      within("#merchant-total-cost-#{merchant_1.id}") do
        expect(page).to have_content(merchant_1.total_merchant_price/100)
      end
      within("#merchant-total-cost-#{merchant_2.id}") do
        expect(page).to have_content(merchant_2.total_merchant_price/100)
      end
    end
  end
end
