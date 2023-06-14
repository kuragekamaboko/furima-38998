FactoryBot.define do
  factory :user do
    name {'てすと'}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {'テスト'}
    surname {'テスト'}              
    name_kana {'テスト'}
    surname_kana {'テスト'}
    birthday {Date.today}
  end
end