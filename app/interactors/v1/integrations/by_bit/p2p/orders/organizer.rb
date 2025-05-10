module Integrations
  module ByBit
    module P2p
      module Orders
        class Organizer < BaseOrganizer
          organize Initialization,
                   FetchOrders,
                   PersistTrades
        end
      end
    end
  end
end
