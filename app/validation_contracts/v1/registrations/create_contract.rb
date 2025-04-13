module V1
  module Registrations
    class CreateContract < ApplicationContract
      option :scope

      params do
        required(:email).filled(:string, format?: User::EMAIL_REGEXP)
        required(:password).filled(:string, min_size?: User::MIN_PASSWORD_SIZE)
        required(:password_confirmation).filled(:string, min_size?: User::MIN_PASSWORD_SIZE)
      end

      rule(:email) do
        key.failure("is already taken") if scope.exists?(email: value)
      end

      rule(:password_confirmation, :password) do
        if values[:password] != values[:password_confirmation]
          key(:password_confirmation).failure("does not match password")
        end
      end
    end
  end
end
