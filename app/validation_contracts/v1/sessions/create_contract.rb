module V1
  module Sessions
    class CreateContract < ApplicationContract
      params do
        required(:email).filled(:string)
        required(:password).filled(:string, min_size?: User::MIN_PASSWORD_SIZE)
      end
    end
  end
end
