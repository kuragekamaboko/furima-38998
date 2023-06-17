require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規登録' do
    context '商品登録できないとき' do 
      context '商品名' do 
        it '商品名が空では登録できない' do
          @item.name = '';
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
      end
      context '商品の説明' do 
        it '商品の説明が空では登録できない' do
          @item.info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end
      end
      context 'カテゴリー' do 
        it 'カテゴリーが空では登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
      end
      context '商品の状態' do 
        it '商品の状態が空だと登録できない' do
          @item.sales_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end
      end
      context '配送料の負担' do
        it '配送料の負担が空では登録できない' do
          @item.shipping_fee_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
        end
      end
      context '発送元の地域' do 
        it '発送元の地域が空では登録できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
      end
      context '発送までの日数' do 
        it '発送までの日数が空では登録できない' do
          @item.scheduled_delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
      end
      context '販売価格' do 
        it '販売価格が空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '販売価格が300円未満では登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '販売価格が9,999,999円より大きいとき登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
      context '商品画像' do 
        it '商品画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
    context '新規登録ができるとき' do
      it '必要な情報が入力されれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
