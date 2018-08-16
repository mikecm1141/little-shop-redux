RSpec.describe 'Merchant Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Big Boots Store')
    @merchant_2 = Merchant.create(name: 'Small Boots Store')
  end
  context 'Shows All Merchants Details' do
    it 'shows merchant name' do

      visit '/merchants'

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
  end
end
