module Bookings::Create
  Schema = Dry::Validation.Params do
    configure do
      config.messages = :i18n

      def vehicle_id?(value)
        !/\d+/.match(value).nil?
      end

      def price?(value)
        !/\d+/.match(value).nil?
      end
    end

    required(:vehicle_id).filled(:vehicle_id?)
    required(:price).filled(:price?)
  end
end
