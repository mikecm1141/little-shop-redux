RSpec.describe 'Show Merchant Page' do

  context 'Show Merchant Details' do
    it 'shows merchant name' do
      merchant = Merchant.create(name: 'Nick and Mike')
      visit "/merchants/#{Merchant.last.id}"

      expect(page).to have_content(merchant.name)
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
