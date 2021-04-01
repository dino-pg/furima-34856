require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it '商品写真が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が未選択だと出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '配送料の負担が未選択だと出品できない' do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge is not a number")
      end
      it '配送元の地域が未選択だと出品できない' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it '配送までの日数が未選択だと出品できない' do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end
      it '販売価格が空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
