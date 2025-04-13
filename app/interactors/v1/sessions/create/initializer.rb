module V1
  module Sessions
    module Create
      class Initializer < BaseInteractor
        def call
          context.class_validator = V1::Sessions::CreateContract
          context.scope = User
        end
      end
    end
  end
end
