RSpec.describe 'Show Merchant Page' do

  context 'Show Merchant Details' do
    it 'shows merchant name' do
      merchant = Merchant.create(name: 'Nick and Mike')
      visit "/merchants/#{Merchant.last.id}"

      expect(page).to have_content(merchant.name)
    end
    it 'shows merchant items' do
      merchant_1 = Merchant.create(name: 'Mike\'s, Wrenches')
      item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: 10.00, merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: 56.62, merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_css("img[src*='#{item_1.image}']")
      expect(page).to have_css("img[src*='#{item_2.image}']")
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
      within("#unit-price-#{item_1.id}") do
        expect(page).to have_content(item_1.unit_price)
      end
      within("#unit-price-#{item_2.id}") do
        expect(page).to have_content(item_2.unit_price)
      end
      expect(page).to have_link(item_1.name, href: "/items/#{item_1.id}")
      expect(page).to have_link(item_2.name, href: "/items/#{item_2.id}")
    end

    it 'has edit and delete buttons' do
      merchant = Merchant.create(name: 'Nick and Mike')
      visit "/merchants/#{Merchant.last.id}"

      click_on 'Edit'
      expect(current_path).to eq "/merchants/#{Merchant.last.id}/edit"

      visit "/merchants/#{Merchant.last.id}"
      click_on 'Delete'
      expect(current_path).to eq "/merchants"
    end
  end
end
