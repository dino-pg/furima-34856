require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    befo do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空だと登録できないこと'
    
    end

    it 'emailが空だと登録できないこと'

    end

    it 'emailが一意性であること'

    end

    it 'emailに@を含む必要があること'

  end

    it 'passwordが空ではないこと'

    end

    it 'passwordは6文字以上での入力が必須であること'

    end

    it 'passwordが半角英数字混合での入力が必須であること'

    end

    it 'passwordは確認用も含めて2回入力すること'

    end

    it 'passwordとpassword（確認用）は、値の一致が必須であること'

    end

    it 'ユーザー本名は苗字と名前がそれぞれ必須であること'

    end

    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること'

    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること'

    end

    it '生年月日が必須であること'

    end

    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること'

    end

    it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること'

    end

    it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること'

    end

    it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること'

    end
  end
end
