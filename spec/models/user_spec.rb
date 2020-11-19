require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録ができる場合' do
        it "nickname,email,password,password_confirmationが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上且、password_confirmationが一致していると登録できること" do
          @user.password = 'abc123'
          @user.password_confirmation = 'abc123'
          expect(@user).to be_valid
        end
      end
      context '新規登録ができない場合' do
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "nicknameが７文字以上では登録できないこと" do
          @user.nickname = "KENTARO"
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
        end
        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが５文字以下では登録できないこと" do
          @user.password = "abcde"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "password_confirmationが空では登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "password_confirmationがpasswordと異なると登録できないこと" do
          @user.password = "abc123"
          @user.password_confirmation = "123abc"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end
