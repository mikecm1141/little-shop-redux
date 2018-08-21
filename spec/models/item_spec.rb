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
    before(:each) do
      @item_1 = Item.create(name: 'Wrench', description: 'Fixes things', unit_price: "1000", merchant_id: 1, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      @item_2 = Item.create(name: 'Screwdriver', description: 'Fixes things', unit_price: "2000", merchant_id: 2, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
      @item_3 = Item.create(name: 'Hammer', description: 'Fixes things', unit_price: "3000", merchant_id: 3, image: 'https://www.harborfreight.com/media/catalog/product/i/m/image_16157.jpg')
    end
    it '.total_item_count' do
      total = Item.total_item_count

      expect(total).to eq(3)
    end
    it '.average_price' do
      total = Item.average_price

      expect(total).to eq(20)
    end
    it '.newest_item' do
      total = Item.newest_item

      expect(total).to eq('Hammer')
    end
    it '.oldest_item' do
      total = Item.oldest_item

      expect(total).to eq('Wrench')
    end

    it '.last_updated' do
      item = Item.create(name: 'Test Item', description: 'Test Desc', unit_price: '1200', merchant_id: 1, image: 'turing.png')
      last_updated = Item.last_updated

      expect(last_updated).to eq(item.updated_at)
    end
  end
end
