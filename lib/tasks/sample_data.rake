namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    admin = User.create!(name: 'Admin User',
                         email: 'admin@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         admin: true)

    99.times do |n|
      name = Faker::Name.name
      email = "user#{n+1}@example.com"
      password = 'password'
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    15.times do |n|
      title = Faker::Lorem.sentence(4)
      date = Random.date
      seats = Random.number(5..20)
      price = Random.number(5..20)
      duration_input = "#{Random.number(20..180)} minutes"
      tour = Tour.create!(title: title,
                          tour_date: date,
                          total_seats: seats,
                          price_cents: price,
                          duration_before_typecast: duration_input)
      ((seats-1)/2).times do
        tour.bookings.create(num_seats: 2, paid: true)
      end
    end

  end
end