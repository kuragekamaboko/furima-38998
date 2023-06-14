require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(
        nickname: '', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: '', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: '', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a0000', 
        password_confirmation: 'a0000',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが数字のみでは登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: '000000', 
        password_confirmation: '000000',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが英語のみでは登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'aaaaaa', 
        password_confirmation: 'aaaaaa',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordとパスワードの確認が一致しない時は登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00001',
        name:'てすと',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nameが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが半角英数字では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'123abc',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Name is invalid")
    end
    it 'surnameが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'surnameが半角英数字では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'tarou',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Surname is invalid")
    end
    it 'name_kanaが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'たろう',
        surname:'たろう',
        name_kana:'',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Name kana can't be blank")
    end
    it 'name_kanaがカタカナ以外では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'てすと',
        surname:'たろう',
        name_kana:'てすと',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Name kana is invalid")
    end
    it 'surname_kanaが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'たろう',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Surname kana can't be blank")
    end
    it 'surname_kanaがカタカナではない場合登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'たろう',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'たろう',
        birthday:Date.today
      )
      user.valid?
      expect(user.errors.full_messages).to include("Surname kana is invalid")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:''
      )
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '必要な情報が入力されれば登録できる' do
      user = User.new(
        nickname: 'test', 
        email: 'test@example', 
        password: 'a00000', 
        password_confirmation: 'a00000',
        name:'たろう',
        surname:'たろう',
        name_kana:'テスト',
        surname_kana:'タロウ',
        birthday:Date.today
      )
      expect(user).to be_valid
    end
  end
end
