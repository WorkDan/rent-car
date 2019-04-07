module Searchs::Index
  Schema = Dry::Validation.Params do
    configure do
      config.messages = :i18n

      def date?(value)
        !/\d{4}-\d{2}-\d{2}/.match(value).nil?
      end
    end

    required(:city).filled(:str?)
    required(:start_date).filled(:str?, :date?)
    required(:end_date).filled(:str?, :date?)
  end
end
