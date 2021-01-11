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

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
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

    it "katakana_Last_nameが空では登録できないこと" do
      @user.katakana_Last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
