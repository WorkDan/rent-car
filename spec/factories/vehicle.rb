FactoryBot.define do
  factory :vehicle do
    brand { 'BMW' }
    model { 'X3' }
    plate_number { 'XC123' }
    seats_count { 1 }
    large_bag_count { 1 }
    small_bag_count { 1 }
    doors_count { 4 }
    air_conditioning { true }
    automatic_gearbox { true }
  end
end