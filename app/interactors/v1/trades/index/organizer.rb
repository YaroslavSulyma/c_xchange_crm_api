module V1
  module Trades
    module Index
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::Validate,
                 Common::FetchCollection
      end
    end
  end
end
