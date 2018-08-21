RSpec.describe Invoice, type: :model do
  describe 'Validations' do
    it 'has one merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end
    it {should validate_presence_of(:customer_id)}
    it {should validate_presence_of(:merchant_id)}
    it {should validate_presence_of(:status)}
  end
  describe 'Class Methods' do
    before(:each) do
      @invoice_1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'pending')
      @invoice_2 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'pending')
      @invoice_3 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'returned')
      @invoice_4 = Invoice.create(customer_id: 3, merchant_id: 1, status: 'shipped')
      @invoice_item_1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: "100")
      @invoice_item_2 = InvoiceItem.create(item_id: 2, invoice_id: 2, quantity: 3, unit_price: "200")
      @invoice_item_3 = InvoiceItem.create(item_id: 3, invoice_id: 3, quantity: 4, unit_price: "300")
      @invoice_item_4 = InvoiceItem.create(item_id: 3, invoice_id: 4, quantity: 5, unit_price: "250")
    end
    it '.last_updated' do
      last_updated = Invoice.last_updated

      expect(last_updated).to eq(@invoice_4.updated_at)
    end
    it 'should show percent_pending' do
      pending = Invoice.percent_pending

      expect(pending).to eq(50)
    end
    it 'should show percent_shipped' do
      shipped = Invoice.percent_shipped

      expect(shipped).to eq(25)
    end
    it 'should show percent_returned' do
      returned = Invoice.percent_returned

      expect(returned).to eq(25)
    end
    it 'should show highest_price' do
      highest = Invoice.highest_price

      expect(highest).to eq(3)
    end
    it 'should show lowest_price' do
      lowest = Invoice.lowest_price

      expect(lowest).to eq(1)
    end
    it 'should show highest_quantity' do
      highest = Invoice.highest_quantity

      expect(highest).to eq(4)
    end
    it 'should show lowest_quantity' do
      lowest = Invoice.lowest_quantity

      expect(lowest).to eq(1)
    end
  end
end
