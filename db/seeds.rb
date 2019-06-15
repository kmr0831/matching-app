User.create(name: "sssss",email: "sssss@sssss.com",city: "東京",favorite_singer: "sssss",content: "sssssssssssssss", password: "sssss0831", password_confirmation: "sssss0831")
User.create(name: "kkkkk",email: "kkkkk@kkkkk.com",city: "愛知",favorite_singer: "kkkkk",content: "kkkkkkkkkkkkkkk", password: "kkkkk0831", password_confirmation: "kkkkk0831")

50.times do |n|
  name=Faker::Name.name
  email="example-#{n+1}@railstutorial.org"
  password="password"
  User.create!(name: name,email: email,password: password,password_confirmation: password)
end
