RSpec.describe 'Merchant Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Big Boots Store')
    @merchant_2 = Merchant.create(name: 'Small Boots Store')
    visit '/merchants'
  end
  context 'Shows All Merchants Details' do
    it 'shows merchant name' do
      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
  end
  context 'Shows Merchant Page Details' do
    it 'shows link to edit merchant' do
      expect(page).to have_button('Edit')
    end
    it 'shows link to delete merchant' do
      expect(page).to have_button('Delete')
    end
    it 'shows link to show individual merchant' do
      expect(page).to have_link(@merchant_1.name, href: "/merchants/#{@merchant_1.id}")
    end
    it 'shows link to create new merchant' do
      expect(page).to have_link('New Merchant', href: '/merchants/new')
    end

  end
end
