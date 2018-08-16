RSpec.describe 'Create Merchant Page' do
  before(:each) do
    visit '/merchants/new'
  end
  context 'New Merchant Page Details' do
    it 'displays new merchant header' do
      expect(page).to have_content('New Merchant')
    end
    it 'labels input box' do
      expect(page).to have_content('Merchant Name:')
    end
    it 'has a text field' do
      expect(page).to have_field('merchant[name]')
    end
    it 'has a create merchant button' do
      expect(page).to have_button('Create Merchant')
    end
  end
end
