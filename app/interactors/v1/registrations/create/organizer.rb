module V1
  module Registrations
    module Create
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::Validate,
                 Common::CreateRecord,
                 CreateSession
      end
    end
  end
end
