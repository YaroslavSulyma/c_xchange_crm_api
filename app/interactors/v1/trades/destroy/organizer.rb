module V1
  module Trades
    module Destroy
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::FetchRecord,
                 Common::DestroyRecord
      end
    end
  end
end
