require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
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
    #   it '商品名が空だと出品できない' do
    #     @item.name = nil
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include("Name can't be blank")
    #   end
    #   it '商品説明が空だと出品できない' do
    #     @item.introduction = nil
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Introduction can't be blank")
    #   end
    #   it 'カテゴリーが未選択だと出品できない' do
    #     @item.category = 0
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Category can't be blank")
    #   end
    #   it '商品の状態が未選択だと出品できない' do
    #     @item.item_condition = 0
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Item_condition can't be blank")
    #   end
    #   it '配送料の負担が未選択だと出品できない' do
    #     @item.postage = 0
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Postage can't be blank")
    #   end
    #   it '配送元の地域が未選択だと出品できない' do
    #     @item.prefecture = 0
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Prefecture can't be blank")
    #   end
    #   it '配送までの日数が未選択だと出品できない' do
    #     @item.prepare = 0
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Prepare can't be blank")
    #   end
    #   it '販売価格が空だと出品できない' do
    #     @item.price = nil
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("Price can't be blank")
    #   end
    #   it 'priceが全角数字だと出品できない' do
    #     @item.price = "２０００"
    #     @item.valid?
    #     expect(@item.errors.full_messsages).to include("")
    #   end
    end
  end
end
