RSpec.describe Item,type: :model do
  describe 'Validations' do
    it 'has one merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:unit_price)}
    it {should validate_presence_of(:merchant_id)}
    it {should validate_presence_of(:image)}
  end
  describe 'Class Methods' do
    it '.last_updated' do
      item = Item.create(name: 'Test Item', description: 'Test Desc', unit_price: '1200', merchant_id: 1, image: 'turing.png')
      last_updated = Item.last_updated

      expect(last_updated).to eq(item.updated_at)
    end
  end
end
