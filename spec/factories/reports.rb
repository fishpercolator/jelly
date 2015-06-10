FactoryGirl.define do

  factory :achievement do
    text { Faker::Hacker.say_something_smart }
  end
  
  factory :task do
    text { Faker::Hacker.say_something_smart }
  end

  factory :report do
    today { Date.today }
    previous_day { Faker::Date.backward(3) }
    excited { Faker::Hacker.say_something_smart }
    jelly { rand(1..23) }
    help_needed { Faker::Name.name }
    after :build do |report|
      report.achievements = 3.times.collect { create(:achievement) }
      report.tasks = 3.times.collect { create(:task) }
    end
  end

end
