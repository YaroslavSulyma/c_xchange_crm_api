module V1
  class CurrenciesController < AuthorizedController
    def index
      result = V1::Currencies::Index::Organizer.call!
      render json: result.data, status: result.status_code
    end
  end
end
