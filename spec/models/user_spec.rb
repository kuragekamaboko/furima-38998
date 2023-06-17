require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      context 'ニックネーム' do 
        it 'nicknameが空では登録できない' do
          @user.nickname = '';
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
      end
      context 'メールアドレス' do 
        it 'メールアドレスが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'メールアドレスに@を含まない場合は登録できない' do
          @user.email = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end
      context 'パスワード' do 
        it 'パスワードが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードが6文字未満では登録できない' do
          @user.password = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'パスワードが数字のみでは登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードが英字のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it '全角文字を含むパスワードでは登録できない' do
          @user.password = 'ｂaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードとパスワードの確認が一致しない時は登録できない' do
          @user.password = 'a00000'
          @user.password_confirmation = 'a00001'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      context '姓・名(全角)' do 
        it '名（全角）が空だと登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it '名（全角）に半角文字が含まれていると登録できない' do
          @user.name = 'abc123'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name is invalid")
        end
        it '姓（全角）が空だと登録できない' do
          @user.surname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname can't be blank")
        end
        it '姓（全角）に半角文字が含まれていると登録できない' do
          @user.surname = 'a123'
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname is invalid")
        end
      end
      context '姓・名（カナ）' do
        it '名（カナ）が空では登録できない' do
          @user.name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name kana can't be blank")
        end
        it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.name_kana = 'てすと'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name kana is invalid")
        end
        it '姓（カナ）が空では登録できない' do
          @user.surname_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname kana can't be blank")
        end
        it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.surname_kana = 'てすと'
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname kana is invalid")
        end
      end
      context '生年月日' do 
        it '生年月日が空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
    context '新規登録ができるとき' do
      it '必要な情報が入力されれば登録できる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end
