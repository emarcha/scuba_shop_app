namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin User",
                         email: "admin@example.com",
                         password: "password",
                         password_confirmation: "password",
                         admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "user#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    50.times do |n|
      title = Faker::Lorem.sentence
      date = Random.date
      Tour.create!(title: title,
                   tour_date: date)
    end
  end
end