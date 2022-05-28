FactoryBot.define do
  factory :reservation do
    date                {"Fri, 27 May 2022"}
    # Faker::Date.between(from: Date.today, to: 3.days.later)
    time                {"13:00"}
    start_time          {"2022-05-27 04:00"}
    style_id            {2}
    number_of_people_id {2}
    question            {Faker::Lorem.sentence}

    association :user

  end
end
