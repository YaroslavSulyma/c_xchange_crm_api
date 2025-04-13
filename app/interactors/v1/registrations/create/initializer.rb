module V1
  module Registrations
    module Create
      class Initializer < BaseInteractor
        def call
          context.class_validator = V1::Registrations::CreateContract
          context.validator_options = { scope: User }
          context.scope = User
        end
      end
    end
  end
end
