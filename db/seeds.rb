# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vehicle.create!(
  brand: 'BMW',
  model: 'X3',
  plate_number: 'ABC123',
  seats_count: 4,
  large_bag_count: 1,
  small_bag_count: 1,
  doors_count: 4,
  air_conditioning: true,
  automatic_gearbox: false,
  free: true
)

Vehicle.create!(
  brand: 'BMW',
  model: 'X5',
  plate_number: 'ABC223',
  seats_count: 4,
  large_bag_count: 1,
  small_bag_count: 1,
  doors_count: 4,
  air_conditioning: true,
  automatic_gearbox: false,
  free: true
)

Vehicle.create!(
  brand: 'Land Rover',
  model: 'Range rover',
  plate_number: 'ABC213',
  seats_count: 4,
  large_bag_count: 1,
  small_bag_count: 1,
  doors_count: 4,
  air_conditioning: true,
  automatic_gearbox: false,
  free: true
)

