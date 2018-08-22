RSpec.describe 'Item Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Mike\'s, Wrenches')
    @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
    @item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
  end
  context 'Displays Items Details' do
    it 'shows item name' do
      visit '/items'

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
    end
    it 'shows item price' do
      visit '/items'

      expect(page).to have_content("$10.00")
      expect(page).to have_content("$56.62")
    end
    it 'shows item image' do
      visit '/items'

      expect(page).to have_css("img[src*='#{@item_1.image}']")
      expect(page).to have_css("img[src*='#{@item_2.image}']")
    end
  end

  context 'Buttons and Links Navigate Correctly' do
    it 'has link to create a new item' do
      visit '/items'

      expect(page).to have_link('Create A New Item', href: '/items/new')
    end
    it 'has link that navigates to new item page' do
      visit '/items'

      click_on 'Create A New Item'
      expect(current_path).to eq '/items/new'
    end
    it 'has link to item show page' do
      visit '/items'

      click_on @item_1.name
      expect(current_path).to eq "/items/#{@item_1.id}"
      expect(page).to have_content @item_1.name

      visit '/items'

      click_on @item_2.name
      expect(current_path).to eq "/items/#{@item_2.id}"
      expect(page).to have_content @item_2.name
    end
    it 'has link to item dashboard' do
      visit '/items'

      click_on 'Dashboard'

      expect(current_path).to eq '/items-dashboard'
    end
  end
end
