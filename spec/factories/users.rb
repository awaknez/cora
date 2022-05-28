FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {"test1234test"} 
    password_confirmation {password}
    name_first_name       {'悠太郎'}
    name_first_name_kana  {'ユウタロウ'}
    name_last_name        {'高良'}
    name_last_name_kana   {'コウラ'}
    school_id             {3}
    grade_id              {4}
    class_id              {2}
    group_id              {1}
  end
end
