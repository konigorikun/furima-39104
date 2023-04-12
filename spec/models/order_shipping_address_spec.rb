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
        expect(@order_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_numberにはハイフンがないと保存できない' do
        @order_shipping_address.post_number = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('郵便番号(-)ハイフンを含んだ半角数字で入力して下さい')
      end
      it 'post_numberhは半角数字出ないと保存できない' do
        @order_shipping_address.post_number = '１２３-４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('郵便番号(-)ハイフンを含んだ半角数字で入力して下さい')
      end
      it 'ship_from_organizationが空では保存できない' do
        @order_shipping_address.ship_from_organization_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("都道府県を入力して下さい")
      end
      it 'municipalityは空では保存できない' do
        @order_shipping_address.municipality = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberは空では保存できない' do
        @order_shipping_address.house_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberは空では保存できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_number10桁以上でないと保存できない' do
        @order_shipping_address.phone_number = '123-456-789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号(-)ハイフンを含んだ半角数字の10,11桁で入力して下さい')
      end
      it 'phone_number11桁以内でないと保存できない' do
        @order_shipping_address.phone_number = '123-4567-78910'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号(-)ハイフンを含んだ半角数字の10,11桁で入力して下さい')
      end
      it 'phone_number半角数値以外の文字（平仮名・漢字・英数字・記号）が含まれていると保存できない' do
        @order_shipping_address.phone_number = '１２３−４５６７−８９１０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号(-)ハイフンを含んだ半角数字の10,11桁で入力して下さい')
      end
      it 'phone_numberはハイフンが含まれていると保存できない' do
        @order_shipping_address.phone_number = '123-4567-8910'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号(-)ハイフンを含んだ半角数字の10,11桁で入力して下さい')
      end
      it 'tokenが空では購入できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが空では購入できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
