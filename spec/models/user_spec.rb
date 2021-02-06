require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      user = User.new(nickname: '', email: 'test@example', password: '000000a', password_confirmation: '000000a', family_kanji: '山田', first_kanji: '太郎', family_kana: 'ヤマダ', first_kana: 'タロウ', birthday: '2000-12-24')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000a', password_confirmation: '000000a', family_kanji: '山田', first_kanji: '太郎', family_kana: 'ヤマダ', first_kana: 'タロウ', birthday: '2000-12-24')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
