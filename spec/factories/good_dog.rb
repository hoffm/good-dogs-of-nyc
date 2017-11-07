FactoryBot.define do
  factory :good_dog do
    sequence(:zip_code) { |n| (11111 + n).to_s }
  end
end
