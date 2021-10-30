FactoryBot.define do
  factory :user do
    name { 'hoge' }
    email { 'hoge@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    profile { 'プロフィール' }
    trait :invalid do 
      name { nil }
    end
  end
end
