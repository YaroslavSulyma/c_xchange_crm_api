module Integration
  module ByBit
    module P2p
      class TradeOrdersSyncJob
        include Sidekiq::Job
        sidekiq_options retry: 2

        def perform(side_status)
          now = DateTime.current
          Integration::ByBit::P2p::Orders::Organizer.call!(
            from_time: now - 2.hours,
            to_time: now,
            side_status: side_status
          )
        end
      end
    end
  end
end
