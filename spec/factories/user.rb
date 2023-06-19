FactoryBot.define do
  factory :user do
    name {'てすと'}
    email {Faker::Internet.free_email}
    password {'a12345'}
    password_confirmation {password}
    nickname {'テスト'}
    surname {'テスト'}              
    name_kana {'テスト'}
    surname_kana {'テスト'}
    birthday {Date.today}
  end
end