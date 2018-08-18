RSpec.describe Item,type: :model do
  describe 'Validations' do

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:unit_price)}
    it {should validate_presence_of(:merchant_id)}
    it {should validate_presence_of(:image)}
  
  end
end
