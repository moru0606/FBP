# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'

  Category.create([
    { name: '食事、おやつ'},
    { name: '遊び、スポット'},
    { name: 'しつけ、トレーニング'},
    { name: '犬用品'},
    { name: '身体、病気'},
    { name: '生活、くらし'},
    { name: 'これから飼うにあたって'}
  ])
end