RSpec.describe 'Item Show Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Mike\'s, Wrenches')
    @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
  end

  context 'Displays Items Details' do
    it 'shows item name' do
      visit "/items/#{@item_1.id}"

      expect(page).to have_content(@item_1.name)
    end
    it 'shows merchant' do
      visit "/items/#{@item_1.id}"

      expect(page).to have_content(@item_1.merchant.name)
    end
    it 'shows item price' do
      visit "/items/#{@item_1.id}"

      expect(page).to have_content("$10.00")
    end
    it 'shows item description' do
      visit "/items/#{@item_1.id}"

      expect(page).to have_content(@item_1.description)
    end
    it 'shows item image' do
      visit "/items/#{@item_1.id}"

      expect(page).to have_css("img[src*='#{@item_1.image}']")
    end
  end

  context 'Navigation and links' do
    it 'has link to merchant page through merchant name' do
      visit "/items/#{@item_1.id}"

      click_on @item_1.merchant.name
      expect(current_path).to eq "/merchants/#{@item_1.merchant_id}"
    end
    it 'has link to edit item' do
      visit "/items/#{@item_1.id}"

      click_on "Edit"
      expect(current_path).to eq "/items/#{@item_1.id}/edit"
    end
    it 'has button to delete item' do
      visit "/items/#{@item_1.id}"

      click_on "Delete"
      expect(current_path).to eq "/items"
      expect(page).to_not have_link(@item_1.name, href:"/items/#{@item_1.id}")
    end

  end
end
