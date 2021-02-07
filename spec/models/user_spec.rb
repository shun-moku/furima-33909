require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfamily_kanjiとfirst_kanjiとfamily_kanaとfirst_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角登では録できない' do
        @user.password = 'パスワーード'
        @user.password_confirmation = 'パスワーード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'family_kanjiが空では登録できない' do
        @user.family_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kanji can't be blank")
      end

      it 'family_kanjiは、漢字・平仮名・カタカナ以外では登録できない' do
        @user.family_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kanji 全角文字を使用してください')
      end
      it 'first_kanjiが空では登録できない' do
        @user.first_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kanji can't be blank")
      end
      it 'first_kanjiは、漢字・平仮名・カタカナ以外では登録できない' do
        @user.first_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kanji 全角文字を使用してください')
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'family_kanaがカタカナ以外では登録できない' do
        @user.family_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana 全角カタカナを使用してください')
      end

      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'first_kanaがカタカナ以外では登録できない' do
        @user.first_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana 全角カタカナを使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
