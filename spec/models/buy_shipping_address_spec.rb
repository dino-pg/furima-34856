require 'rails_helper'

RSpec.describe BuyShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:item)
    @item = FactoryBot.create(:user)
    @buy_shipping_address = FactoryBot.build(:buy_shipping_address, user_id: @user, item_id: @item)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入ががうまくいく時' do
      it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@buy_shipping_address).to be_valid
      end
      it '建物名がない場合でも購入できる' do
        @buy_shipping_address.building_name = ''
        expect(@buy_shipping_address).to be_valid
      end
      context '上手くいかない時' do
        it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do
          @buy_shipping_address.token = nil
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号の保存にはハイフンが必要であること' do
          @buy_shipping_address.postal_code = '1234567'
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include('Postal code is invalid')
        end
        it '電話番号は11桁以内の数値のみ保存可能なこと' do
          @buy_shipping_address.phone_number = '090123456789'
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号は英数字混合では登録出来ないこと' do
          @buy_shipping_address.phone_number = '1a2b3c4d'
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include('Phone number is invalid')
        end
        it '配送先の情報として、郵便番号が必須であること' do
          @buy_shipping_address.postal_code = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include('Postal code is invalid')
        end
        it '配送先の情報として、都道府県が必須であること' do
          @buy_shipping_address.prefectures_id = 1
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Prefectures must be other than 1")
        end
        it '配送先の情報として、市区町村が必須であること' do
          @buy_shipping_address.municipality = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Municipality can't be blank")
        end
        it '配送先の情報として、番地が必須であること' do
          @buy_shipping_address.address = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Address can't be blank")
        end
        it '配送先の情報として、電話番号が必須であること' do
          @buy_shipping_address.phone_number = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'user_idがない場合は購入できないこと' do
          @buy_shipping_address.user_id = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idがない場合は購入できないこと' do
          @buy_shipping_address.item_id = ''
          @buy_shipping_address.valid?
          expect(@buy_shipping_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
