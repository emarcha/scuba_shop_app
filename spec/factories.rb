FactoryGirl.define do 
  factory :user do 
    sequence(:name)   { |n| "Example User#{n}"}
    sequence(:email)  { |n| "user#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :tour do
    title       'Sample tour'
    tour_date   '1/1/2013'
    total_seats 10
    price_cents 25
    duration_before_typecast '300 minutes'
  end

  factory :booking do
    num_seats   2
    paid        true
    credit_card_number '4539762311332008'
    card_security_code '773'
    card_name   'Card Owner'
    tour
  end
end 
