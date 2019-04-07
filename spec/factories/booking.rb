FactoryBot.define do
  factory :booking do
    start_date { Time.now + 1.day }
    end_date   { Time.now + 2.day }
    status { 0 }
  end
end