module V1
  class PlatformsController < AuthorizedController
    def index
      result = V1::Platforms::Index::Organizer.call!
      render json: result.data, status: result.status_code
    end
  end
end
