module V1
  module Sessions
    module Create
      class Organizer < BaseOrganizer
        organize Initializer,
                 Common::Validate,
                 CreateSession
      end
    end
  end
end
