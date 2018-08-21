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
    it '.last_updated' do
      invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'paid')
      last_updated = Invoice.last_updated

      expect(last_updated).to eq(invoice.updated_at)
    end
  end
end
