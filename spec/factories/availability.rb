FactoryGirl.define do
  factory :availability do
    association :mentor, factory: :mentor
    timezone "UTC"
    duration 30
    start_time  DateTime.new(2014, 1, 1)
    location "Dev Bootcamp Chicago"
  end
end
