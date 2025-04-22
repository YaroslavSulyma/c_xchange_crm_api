module V1
  module Trades
    module Create
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::Validate,
                 Common::CreateRecord
      end
    end
  end
end
