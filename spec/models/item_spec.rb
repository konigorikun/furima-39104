require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品できる場合' do
      it '正常に出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'detailが空では保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力して下さい')
      end
      it 'condition空では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力して下さい')
      end
      it 'delivery_charge空では保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力して下さい')
      end
      it 'ship_from_organization空では保存できない' do
        @item.ship_from_organization_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力して下さい')
      end
      it 'days_to_ship空では保存できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力して下さい')
      end
      it 'cost空では保存できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力して下さい')
      end
      it 'costが半角数値以外の文字（平仮名・漢字・英数字・記号）が含まれていると保存できない' do
        @item.cost = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'costが10_000_000以上だと保存できない' do
        @item.cost = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'costが299以下だと保存できない' do
        @item.cost = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
