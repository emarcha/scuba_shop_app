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
    credit_card_number '4539762311332008'
    card_security_code '773'
    card_name   'Card Owner'
    card_exp_month 1
    card_exp_year  '2013'
    confirmation_email 'user@example.com'
    billing_address '1234 Fake Street'
    billing_state 'IL'
    billing_zipcode '12345-1234'
    tour
  end
end 
