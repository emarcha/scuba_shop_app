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

    15.times do |n|
      title = Faker::Lorem.sentence(word_count = 4, supplemental = false)
      date = Random.date
      seats = Random.number(1..20)
      price = Random.number(1..20)
      duration_input = "#{Random.number(1..120)} minutes"
      Tour.create!(title: title,
                   tour_date: date,
                   total_seats: seats,
                   available_seats: seats,
                   price_cents: price,
                   duration_before_typecast: duration_input)
    end
  end
end