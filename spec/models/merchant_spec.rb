RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create

      expect(merchant).to_not be_valid
    end
  end
end
