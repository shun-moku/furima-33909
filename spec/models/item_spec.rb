require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品できるとき' do
      it 'name, description, category_id, condition_id, shipping_charge_id, region_id, delivery_date_id, price, imageが存在するとき出品可能' do
        expect(@item).to be_valid
      end
      it 'nameが40文字以内であれば登録できる' do
        @item.name = 'iPhone'
        expect(@item).to be_valid
      end
    end

  end

end
