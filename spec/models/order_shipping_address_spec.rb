require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入実装' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_numberが空では保存できない' do
        @order_shipping_address.post_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにはハイフンがないと保存できない' do
        @order_shipping_address.post_number = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'post_numberhは半角数字出ないと保存できない' do
        @order_shipping_address.post_number = '１２３-４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'ship_from_organizationが空では保存できない' do
        @order_shipping_address.ship_from_organization_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Ship from organization can't be blank")
      end
      it 'municipalityは空では保存できない' do
        @order_shipping_address.municipality = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberは空では保存できない' do
        @order_shipping_address.house_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberは空では保存できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number10桁以上でないと保存できない' do
        @order_shipping_address.phone_number = '123-456-789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_number11桁以内でないと保存できない' do
        @order_shipping_address.phone_number = '123-4567-78910'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_number半角数値以外の文字（平仮名・漢字・英数字・記号）が含まれていると保存できない' do
        @order_shipping_address.phone_number = '１２３−４５６７−８９１０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberはハイフンが含まれていると保存できない' do
        @order_shipping_address.phone_number = '123-4567-8910'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
