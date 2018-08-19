RSpec.describe Invoice,type: :model do
  describe 'Validations' do
    it 'has one merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end

    it {should validate_presence_of(:customer_id)}
    it {should validate_presence_of(:merchant_id)}
    it {should validate_presence_of(:status)}
  end
end
