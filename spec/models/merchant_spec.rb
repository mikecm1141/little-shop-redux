RSpec.describe Merchant,type: :model do
  describe 'Validations' do
    it 'should have many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
    it {should validate_presence_of(:name)}
  end
  describe 'Class Methods' do
    it '.last_updated' do
      merchant = Merchant.create(name: 'Test Merchant')
      last_updated = Merchant.last_updated

      expect(last_updated).to eq(merchant.updated_at)
    end
  end
end
