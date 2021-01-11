require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "email、password、password_confirmation、nick_name、first_name、last_name、katakana_first_name、katakana_Last_name、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "Aaaa0000"
      @user.password_confirmation = "Bbbb111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordに半角英数字が含まれていないと登録できないこと" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password is invalid" )
    end

    it "nick_nameが空では登録できないこと" do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "katakana_first_nameが空では登録できないこと" do
      @user.katakana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
    end

    it "katakana_first_nameはカタカナじゃないと登録できないこと" do
      @user.katakana_first_name = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Katakana first name is invalid" )
    end

    it "katakana_Last_nameが空では登録できないこと" do
      @user.katakana_Last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
    end

    it "katakana_Last_nameはカタカナじゃないと登録できないこと" do
      @user.katakana_Last_name = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Katakana last name is invalid" )
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
