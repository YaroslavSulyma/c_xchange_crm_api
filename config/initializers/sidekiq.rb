require "sidekiq/api"

Sidekiq.configure_server do |config|
  config.redis = { host: ENV.fetch("REDIS_HOST"), port: ENV.fetch("REDIS_PORT"), db: ENV.fetch("REDIS_SIDEKIQ_DB", 2) }

  # Set the log level to error for more detailed logs
  config.logger.level = Rails.env.production? ? Logger::ERROR : Logger::DEBUG

  # Create a new logger instance for Sidekiq jobs
  config.logger = Logger.new(Rails.root.join("log", "sidekiq.log"))

  config.on(:startup) do
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { host: ENV.fetch("REDIS_HOST"), port: ENV.fetch("REDIS_PORT"), db: ENV.fetch("REDIS_SIDEKIQ_DB", 2) }
end
