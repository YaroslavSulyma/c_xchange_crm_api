module V1
  module Trades
    module Update
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::Validate,
                 Common::FetchRecord,
                 Common::UpdateRecord
      end
    end
  end
end
