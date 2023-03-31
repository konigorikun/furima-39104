require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context '商品出品できる場合' do
      it '正常に出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空では保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'category空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'condition空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it 'delivery_charge空では保存できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge Select")
      end
      it 'ship_from_organization空では保存できない' do
        @item.ship_from_organization_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from organization Select")
      end
      it 'days_to_ship空では保存できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship Select")  
      end
      it 'cost空では保存できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'costが半角数値以外の文字（平仮名・漢字・英数字・記号）が含まれていると保存できない' do
        @item.cost = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost is not a number")
      end
      it 'costが10_000_000以上だと保存できない' do
        @item.cost = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be less than or equal to 9999999")
      end
      it 'costが299以下だと保存できない' do
        @item.cost = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be greater than or equal to 300")
      end
      it 'userが紐付いていないと保存できない'  do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end