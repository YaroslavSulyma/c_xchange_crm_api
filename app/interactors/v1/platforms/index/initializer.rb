module V1
  module Platforms
    module Index
      class Initializer < BaseInteractor
        def call
          context.data = Platform.select(:id, :name).order(:name)
          context.status_code = :ok
        end
      end
    end
  end
end
