RSpec.describe 'Shows Invoice Page' do
  context 'Shows Invoice Details' do
    before(:each) do
      @invoice_1 = Invoice.create(customer_id: 1, merchant_id: 1, status: "shipped")
      @merchant_1 = Merchant.create(name: 'Mikes Wrenches')
      @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: 10.00, merchant_id: 1, image: 'test_data')
      @item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: 56.62, merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
    end
    it 'shows invoice id' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("#{@invoice_1.id}")
    end
    it 'shows invoice status' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("#{@invoice_1.status.capitalize}")
    end
    it 'shows invoice merchant' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("#{@invoice_1.merchant.name}")
    end
  end
  context 'Shows Invoice Item Details' do
    before(:each) do
      @invoice_1 = Invoice.create(customer_id: 1, merchant_id: 1, status: "shipped")
      @merchant_1 = Merchant.create(name: 'Mikes Wrenches')
      @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: '1000', merchant_id: 1, image: 'test_data')
      @item_2 = Item.create(name: 'Vape', description: 'Vape Nation', unit_price: '5662', merchant_id: 1, image: 'https://assets.vaping.com/media/catalog/product/cache/1/image/1500x1500/9df78eab33525d08d6e5fb8d27136e95/2/0/2017-01-04-09_44_475596.png')
      @invoice_item_1 = @invoice_1.invoice_items.create(item_id: @item_1.id, quantity: 5, unit_price: '1000')
      @invoice_item_2 = @invoice_1.invoice_items.create(item_id: @item_2.id, quantity: 5, unit_price: '5662')
    end
    it 'shows invoice_item id' do
      visit "/invoices/#{Invoice.first.id}"

      within("#item-id-#{@item_1.id}") do
        expect(page).to have_content(@item_1.id)
      end
      within("#item-id-#{@item_2.id}") do
        expect(page).to have_content(@item_2.id)
      end
    end
    it 'shows item name' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
    end
    it 'shows invoice total' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content('$333.10')
    end
    it 'shows invoice_item unit_price' do
      visit "/invoices/#{Invoice.first.id}"

      expect(page).to have_content("$10.00")
      expect(page).to have_content("$56.62")
    end
    it 'shows invoice_item quantity' do
      visit "/invoices/#{Invoice.first.id}"

      within("#invoice-item-quantity-#{@invoice_item_1.id}") do
        expect(page).to have_content("5")
      end
      within("#invoice-item-quantity-#{@invoice_item_2.id}") do
        expect(page).to have_content("5")
      end
    end
  end
end
