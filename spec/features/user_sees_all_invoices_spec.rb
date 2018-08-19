RSpec.describe 'Invoice Index Page' do
  before(:each) do
    @invoice_1 = Invoice.create(customer_id: 1, merchant_id: 12345, status: "shipped")
    @invoice_2 = Invoice.create(customer_id: 2, merchant_id: 23456, status: "pending")
  end
  context 'Displays Invoice Details' do
    it 'shows merchant id' do
      visit '/invoices'
      expect(page).to have_content("12345")
    end
  end
  # context 'shows invoice buttons' do
  #   it 'shows link to edit invoice' do
  #     visit '/invoices'
  #
  #     expect(page).to have_button 'Edit'
  #   end
  #   it 'shows link to delete invoice' do
  #     visit '/invoices'
  #
  #     expect(page).to have_button 'Delete'
  #   end
  #   it 'shows link to view individual invoice' do
  #     visit '/invoices'
  #
  #     expect(page).to have_link(@invoice.merchant_id, href:"/invoices/#{invoice.merchant_id}")
  #   end
  # end
end
