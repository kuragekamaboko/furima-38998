require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    describe '異常系' do 
      describe 'ニックネーム' do 
        it 'nicknameが空では登録できない' do
          user = FactoryBot.build(:user, nickname: '')
          user.valid?
          expect(user.errors.full_messages).to include("Nickname can't be blank")
        end
      end
      describe 'メールアドレス' do 
        it 'メールアドレスが空では登録できない' do
          user = FactoryBot.build(:user,email:'')
          user.valid?
          expect(user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したメールアドレスが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end
      describe 'パスワード' do 
        it 'パスワードが空では登録できない' do
          user = FactoryBot.build(:user,password:'')
          user.valid?
          expect(user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードが6文字未満では登録できない' do
          user = FactoryBot.build(:user,password:'a1234')
          user.valid?
          expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'パスワードが数字のみでは登録できない' do
          user = FactoryBot.build(:user,password:'123456')
          user.valid?
          expect(user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードが英字のみでは登録できない' do
          user = FactoryBot.build(:user,password:'aaaaaa')
          user.valid?
          expect(user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードとパスワードの確認が一致しない時は登録できない' do
          user = FactoryBot.build(:user,password:'a00000',password_confirmation: 'a00001',)
          user.valid?
          expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      describe '姓・名(全角)' do 
        it '名（全角）が空だと登録できない' do
          user = FactoryBot.build(:user,name:'')
          user.valid?
          expect(user.errors.full_messages).to include("Name can't be blank")
        end
        it '名（全角）に半角文字が含まれていると登録できない' do
          user = FactoryBot.build(:user,name:'abc123')
          user.valid?
          expect(user.errors.full_messages).to include("Name is invalid")
        end
        it '姓（全角）が空だと登録できない' do
          user = FactoryBot.build(:user,surname:'')
          user.valid?
          expect(user.errors.full_messages).to include("Surname can't be blank")
        end
        it '姓（全角）に半角文字が含まれていると登録できない' do
          user = FactoryBot.build(:user,surname:'a123')
          user.valid?
          expect(user.errors.full_messages).to include("Surname is invalid")
        end
      end
      describe '姓・名（カナ）' do
        it '名（カナ）が空では登録できない' do
          user = FactoryBot.build(:user,name_kana:'')
          user.valid?
          expect(user.errors.full_messages).to include("Name kana can't be blank")
        end
        it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          user = FactoryBot.build(:user,name_kana:'てすと')
          user.valid?
          expect(user.errors.full_messages).to include("Name kana is invalid")
        end
        it '姓（カナ）が空では登録できない' do
          user = FactoryBot.build(:user,surname_kana:'')
          user.valid?
          expect(user.errors.full_messages).to include("Surname kana can't be blank")
        end
        it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          user = FactoryBot.build(:user,surname_kana:'てすと')
          user.valid?
          expect(user.errors.full_messages).to include("Surname kana is invalid")
        end
      end
      describe '生年月日' do 
        it '生年月日が空では登録できない' do
          user = FactoryBot.build(:user,birthday:'')
          user.valid?
          expect(user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
    describe '正常系' do
      it '必要な情報が入力されれば登録できる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end
