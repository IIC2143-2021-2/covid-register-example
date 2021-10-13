FactoryBot.define do
  factory :vaccination do
    vaccine { Vaccination.vaccines["phizer"] }
    appointment_date { Faker::Date.between(from: 2.years.ago, to: Time.now) }
    dose { rand(1..3) }
  end
end
