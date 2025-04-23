module V1
  class SessionsController < ApplicationController
    before_action :authorize_refresh_by_access_header!, only: :update
    before_action :authorize_by_access_header!, only: :destroy

    def create
      result = V1::Sessions::Create::Organizer.call!(input_params: create_params)
      render json: result.data, status: result.status_code
    end

    def update
      result = V1::Sessions::Update::UpdateSession.call!(input_params: { claimless_payload: claimless_payload })
      render json: result.data, status: result.status_code
    end

    def destroy
      result = V1::Sessions::Destroy::DestroySession.call!(input_params: { payload: payload })
      head result.status_code
    end

    private

    def create_params
      params.require(:user).permit(:email, :password)
    end

    def not_authorized
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end
end
