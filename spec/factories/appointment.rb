FactoryGirl.define do
  factory :appointment do
    association :mentor, factory: :mentor
    association :mentee, factory: :mentee
    association :availability, factory: :availability
  end
end
