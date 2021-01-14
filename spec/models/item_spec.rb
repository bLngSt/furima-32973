require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it "image、name、explanation、price、user、category_id、state_id、burden_id、area_id、day_idが存在すれば登録できる" do
      expect(@item).to be_valid
    end
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空では登録できないこと" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが300未満では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが半角英数字以外では登録できないこと" do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "userが空では登録できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "state_idが空では登録できないこと" do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it "burden_idが空では登録できないこと" do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end
    it "area_idが空では登録できないこと" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it "day_idが空では登録できないこと" do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

  end
end

