RSpec.describe 'User Can Edit Invoice' do
  context 'Edit Invoice Details' do
    before(:each) do
      @invoice_1 = Invoice.create(customer_id: 1, merchant_id: 1, status: "shipped")
      @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: 10.00, merchant_id: 1, image: 'test_data')
      @item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: 56.62, merchant_id: 2, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      @merchant_1 = Merchant.create(name: 'Big Boots Store')
      @merchant_2 = Merchant.create(name: 'Small Boots Store')
    end
    it 'shows invoice id' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("#{@invoice_1.id}")
    end
    it 'shows invoice status' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("#{@invoice_1.status.capitalize}")
    end
    it 'displays edit item fields' do
      visit "/invoices/#{@invoice_1.id}/edit"

      expect(page).to have_field('invoice[status]', with: @invoice_1.status)
    end
    it 'updates invoice information' do
      visit "/invoices/#{@invoice_1.id}/edit"

      select "Returned", from: "invoice[status]"
      click_on "Update Invoice"

      expect(current_path).to eq "/invoices/#{@invoice_1.id}"
      expect(page).to have_content 'Returned'
    end
  end
end
