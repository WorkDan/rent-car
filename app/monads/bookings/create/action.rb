require 'dry/monads/maybe'
require 'dry/monads/result'
require 'dry/monads/try'

module Bookings::Create
  class Action
    include Dry::Monads::Maybe::Mixin
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Try::Mixin

    def call(current_user, params: {})
      validation = schema.call(params)

      return Failure(validation.errors) if validation.failure?

      Some(current_user).bind do |user|
        try_create(user, params)
      end
    end

    private

    def try_create(user, params)
      Try() do
        user.bookings.create(
          vehicle_id: params[:vehicle_id],
          price: 10,
          status: 'open'
        )
      end.to_result
    end

    def schema
      [self.class.name.deconstantize, 'Schema'].join('::').constantize
    end
  end
end