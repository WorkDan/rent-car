class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  enum status: [:open, :closed]
end
