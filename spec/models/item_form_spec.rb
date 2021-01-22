require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @item_form = FactoryBot.build(:item_form, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '正常系' do

      it "全て正しく入力されていれば保存ができること" do
        expect(@item_form).to be_valid
      end

      it "buildingは空でも保存できる" do
        @item_form.building = nil
        @item_form.valid?
        expect(@item_form).to be_valid
      end

    end

    context '異常系' do
      it "item_idが空では登録できないこと" do
        @item_form.item_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Item can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @item_form.user_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("User can't be blank")
      end

      it "area_idが空では登録できないこと" do
        @item_form.area_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it "area_idが1では登録できないこと" do
        @item_form.area_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Area must be other than 1")
      end

      it "postalが空では登録できないこと" do
        @item_form.postal = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Postal can't be blank")
      end

      it "cityが空では登録できないこと" do
        @item_form.city = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では登録できないこと" do
        @item_form.address = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Address can't be blank")
      end


      it "phoneが空では登録できないこと" do
        @item_form.phone = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end

      it "tokenが空では登録できないこと" do
        @item_form.token = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Token can't be blank")
      end

      it "postalにはハイフンが無いと登録できないこと" do
        @item_form.postal = "1234567"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Postal is invalid")
      end

      it "phoneにはハイフンがあると登録できないこと" do
        @item_form.phone = "090-1234-5678"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone is invalid")
      end

      it "phoneが英数混合では登録できないこと" do
        @item_form.phone = "aaaaaaaaaaa"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone is invalid")
      end

      it "phoneが空では登録できないこと" do
        @item_form.phone = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end
    end
  end
end