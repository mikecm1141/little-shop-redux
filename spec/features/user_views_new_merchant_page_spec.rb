RSpec.describe 'Create Merchant Page' do
  before(:each) do
    visit '/merchants/new'
  end
  context 'New Merchant Page Details' do
    it 'displays new merchant header' do
      expect(page).to have_content('New Merchant')
    end
    it 'displays merchant page fields' do
      expect(page).to have_content('Merchant Name:')

      fill_in "merchant[name]",with: "Miriam"
      click_on "Create Merchant"
      expect(current_path).to eq "/merchants/#{Merchant.last.id}"
      expect(page).to have_content('Miriam')
    end
  end
end
