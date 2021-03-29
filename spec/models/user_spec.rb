require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
    describe 'ユーザー新規登録' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordは6文字以上での入力が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user.errors.full_messages).to include
      end

      it 'emailに@を含む必要があること' do
        @user.email = 'abcmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword（確認用）は、値の一致が必須であること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

      context '異常系' do
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空ではないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録出来ないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字のみでは登録出来ないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角では登録出来ないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '苗字が空だと登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '苗字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.kana_family_name = 'ヤマダ'
        @user.valid?
        expect(@user).to be_valid
      end

      it '名前のフリガナは全角カタカナ以外では登録出来ないこと' do
      @user.kana_first_name = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
      end

      it '名前が空だと登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
    end
  end
end
end