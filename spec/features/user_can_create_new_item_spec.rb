RSpec.describe 'Create Item Page' do
  context 'New Item Page Details' do
    before(:each) do
      @merchant_1 = Merchant.create(name: 'Mike\'s, Wrenches')
      @merchant_2 = Merchant.create(name: 'Nick & Wrenches')
      @merchant_3 = Merchant.create(name: 'Miriam hates Wrenches')
    end

    it 'displays new item fields' do

      visit '/items/new'

      select "#{@merchant_1.name}", from: "item[merchant_id]"
      fill_in "item[name]", with: "Wrench"
      fill_in "item[description]", with: "Fixes things"
      fill_in "item[unit_price]", with: '1001'
      fill_in "item[image]", with: "test_data"
      click_on "Create Item"

      expect(current_path).to eq "/items/#{Item.last.id}"
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
