require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item_user = FactoryBot.create(:user)
    item = FactoryBot.build(:item,user_id: item_user.id)
    item.save
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id,item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "ユーザー情報とtokenとお届け先情報があれば保存ができること" do
      expect(@order_shipping_address).to be_valid
    end
    it "建物名が空でも保存ができること" do
      @order_shipping_address.building = nil
      expect(@order_shipping_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "userが紐付いていなければ購入できない" do
      @order_shipping_address.user_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
    end
    it "itemが紐付いていなければ購入できない" do
      @order_shipping_address.item_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
    end
    it "都道府県が空では登録できないこと" do
      @order_shipping_address.prefecture_id = 0
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市町村が空では保存ができないこと" do
      @order_shipping_address.city = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では保存ができないこと" do
      @order_shipping_address.addresses = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it "電話番号が空では保存ができないこと" do
      @order_shipping_address.phone_number = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が半角数値以外では保存ができないこと" do
      @order_shipping_address.phone_number = '１２３４５６７８９０'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Phone number must be integer and only 10 or 11  digit")
    end
    it "電話番号が9桁未満では保存ができないこと" do
      @order_shipping_address.phone_number = 000000000
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Phone number must be integer and only 10 or 11  digit")
    end
    it "電話番号が12桁以上では保存ができないこと" do
      @order_shipping_address.phone_number = 000000000000
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Phone number must be integer and only 10 or 11  digit")
    end
    it "郵便番号が空では保存ができないこと" do
      @order_shipping_address.postal_code = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号が「xxx-xxxxx」の形式以外では保存ができないこと" do
      @order_shipping_address.postal_code = '1234567'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "tokenが空では登録できないこと" do
      @order_shipping_address.token = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
