require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'zip_codeが空だと保存できないこと' do
      @order_address.zip_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.zip_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
    end
    it 'region_idを選択していないと保存できないこと' do
      @order_address.region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include()
    end
    it 'cityga空だと保存できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include( "City can't be blank" )
    end
    it 'street_numberが空では保存できないこと' do
      @order_address.street_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include( "Street number can't be blank" )
    end
    it 'buildingは空でも保存できること' do
      @donation_address.building = ''
      expect(@donation_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      binding.pry
      expect(@order_address.errors.full_messages).to include( "Phone number can't be blank" )
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end
