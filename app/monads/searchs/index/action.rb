require 'dry/monads/maybe'
require 'dry/monads/result'
require 'dry/monads/try'

module Searchs::Index
  class Action
    include Dry::Monads::Maybe::Mixin
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Try::Mixin

    def call(params: {})
      validation = schema.call(params)

      return Failure(validation.errors) if validation.failure?

      Success(searchs_vehicles)
    end

    private

    def searchs_vehicles
      Vehicle.all
    end

    def schema
      [self.class.name.deconstantize, 'Schema'].join('::').constantize
    end
  end
end