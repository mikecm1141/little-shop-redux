RSpec.describe 'Edit Item Page' do
  context 'Edit Item Page Details' do
    before(:each) do
      @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'test_data')
      @item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: "5662", merchant_id: 2, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      @merchant_1 = Merchant.create(name: 'Big Boots Store')
      @merchant_2 = Merchant.create(name: 'Small Boots Store')
    end

    it 'displays edit item fields' do
      visit "/items/#{@item_1.id}/edit"

      expect(page).to have_field('item[merchant_id]', with: @item_1.merchant_id)
      expect(page).to have_field('item[name]', with: @item_1.name)
      expect(page).to have_field('item[description]', with: @item_1.description)
      expect(page).to have_field('item[unit_price]', with: @item_1.unit_price)
      expect(page).to have_field('item[image]', with: @item_1.image)
    end

    it 'updates item information' do
      visit "/items/#{@item_1.id}/edit"

      select "#{@merchant_1.name}", from: "item[merchant_id]"
      fill_in "item[name]", with: "Wrench"
      fill_in "item[description]", with: "Fixes things"
      fill_in "item[unit_price]", with: '1001'
      fill_in "item[image]", with: "test_data"
      click_on "Update"

      expect(current_path).to eq "/items/#{@item_1.id}"
      expect(page).to have_content 'Wrench'
      expect(page).to have_content 'Fixes things'
      expect(page).to have_content @merchant_1.name
      within('#unit-price') do
        expect(page).to have_content '$10.01'
      end
      expect(page).to have_css("img[src*='test_data']")
    end
  end
end
