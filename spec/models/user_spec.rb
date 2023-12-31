#userモデルの単体テストコードの一例（spec/models/user_spec.rb内）    

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailで@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordで半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordで半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａａa １１1'
        @user.password_confirmation = 'ａａa １１1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_name_kanjiは、名字が空では登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'personal_name_kanjiは、名前が空では登録できない' do
        @user.personal_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'family_name_kanjiは、名字を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.family_name_kanji = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname 全角文字を使用してください')
      end

      it 'personal_name_kanjiは、名前を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.personal_name_kanji = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname 全角文字を使用してください')
      end

      it 'family_name_kanaは、名字が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'personal_name_kanaは、名前が空では登録できない' do
        @user.personal_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'family_name_kanaは、名字を全角（カタカナ）で入力しないと登録できない' do
        @user.family_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana 全角カタカナのみで入力して下さい')
      end

      it 'personal_name_kanaは、名前を全角（カタカナ）で入力しないと登録できない' do
        @user.personal_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana 全角カタカナのみで入力して下さい')
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
