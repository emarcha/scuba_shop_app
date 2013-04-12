namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin User",
                         email: "admin@example.com",
                         password: "admin-password",
                         password_confirmation: "admin-password",
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
  end
end