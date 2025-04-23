module V1
  class TradesController < V1::AuthorizedController
    def index
      result = V1::Trades::Index::Organizer.call!(input_params: index_params)
      render json: result.data, status: result.status_code
    end

    def create
      result = V1::Trades::Create::Organizer.call!(input_params: create_params)
      head result.status_code
    end

    def update
      result = V1::Trades::Update::Organizer.call!(record_id: params[:id], input_params: update_params)
      head result.status_code
    end

    def destroy
      result = V1::Trades::Destroy::Organizer.call!(record_id: params[:id])
      head result.status_code
    end

    private

    def index_params
      params.permit(filter: [ :date ], page: %i[number items])
    end

    def create_params
      params.require(:trade).permit(
        :platform_id, :currency_id, :fiat_currency_id, :direction, :amount, :price, :total, :fee, :notes
      )
    end

    alias update_params create_params
  end
end
