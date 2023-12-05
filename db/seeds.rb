# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

Genre.create!(
  [
    {name: 'RPG'}, {name: 'アクション'}, {name: 'アクションRPG'}, {name: 'アクションアドベンチャー'}, {name: 'アドベンチャー'},
    {name: 'シューティング'}, {name: 'FPS,TPS'}, {name: 'パズル'}, {name: 'クイズ'}, {name: 'シミュレーション'}, {name: '格闘'}, {name: '音楽'}
  ]
)

Hanako = User.find_or_create_by!(email: "hanako@example.com") do |user|
  user.name = "花子"
  user.password = ENV['USER_PASSWORD']
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

Tarou = User.find_or_create_by!(email: "tarou@example.com") do |user|
  user.name = "太郎"
  user.password = ENV['USER_PASSWORD']
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"),filename:"sample-user2.jpg")
end