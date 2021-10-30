FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    content { '内容10文字以上のサンプル' }
    association :user
  end
end