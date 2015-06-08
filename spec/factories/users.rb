FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.first_name }
    password "password"
    password_confirmation "password"
  end

end
