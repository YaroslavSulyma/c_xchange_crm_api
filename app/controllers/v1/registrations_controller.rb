module V1
  class RegistrationsController < ApplicationController
    def create
      result = V1::Registrations::Create::Organizer.call!(input_params: create_params)
      render json: result.data, status: result.status_code
    end

    private

    def create_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
