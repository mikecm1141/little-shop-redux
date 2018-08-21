RSpec.describe 'Welcome Page' do
  context 'Welcome Page Details' do
    it 'displays navigation card links' do
      visit '/'
      within('#merchant-card') do
        click_on 'Merchants'
      end
      expect(current_path).to eq('/merchants')

      visit '/'
      within('#item-card') do
        click_on 'Items'
      end
      expect(current_path).to eq('/items')

      visit '/'
      within('#invoice-card') do
        click_on 'Invoices'
      end
      expect(current_path).to eq('/invoices')
    end
    it 'displays last updated datetime' do
      merchant = Merchant.create(name: 'Test Merchant 1')
      item = merchant.items.create(name: 'Test Item 1', description: 'None', unit_price: '1200', image: 'turing.png')
      invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'success')

      visit '/'

      within('#merchant-card-updated-at') do
        expect(page).to have_content(merchant.updated_at)
      end
      within('#item-card-updated-at') do
        expect(page).to have_content(item.updated_at)
      end
      within('#invoice-card-updated-at') do
        expect(page).to have_content(invoice.updated_at)
      end
    end
  end
end
