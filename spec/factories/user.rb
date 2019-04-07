FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    full_name { 'John Smitt' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end