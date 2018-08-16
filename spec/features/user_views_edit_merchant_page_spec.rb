RSpec.describe 'Edit Merchant Page' do

  context 'Edit Merchant Details' do
    it 'edits merchant name' do
      merchant = Merchant.create(name:'Nick\'s Curfuffels')
      visit "/merchants/#{Merchant.last.id}/edit"

      expect(page).to have_content('Merchant Name:')
      expect(page).to have_field("merchant[name]", with: "#{merchant.name}")

      fill_in 'merchant[name]', with: "Nick's Odds and Ends"
      click_on 'Update Merchant'

      expect(current_path).to eq "/merchants/#{Merchant.last.id}"
      expect(page).to have_content("Nick's Odds and Ends")
    end
  end
end
