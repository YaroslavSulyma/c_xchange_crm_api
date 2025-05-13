source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.9"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.6.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

gem "active_model_serializers", "~> 0.10.15"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "faraday", "~> 2.13.1"
gem "oj", "~> 3.16.9"

gem "sidekiq-scheduler", "~> 6.0.0"

gem "redis", "~> 5.4.0"
gem "jwt_sessions", "~> 3.2.4"
gem "interactor", "~> 3.1.2"
gem "dry-validation", "~> 1.11.1"
gem "bcrypt", "~> 3.1.20"
gem "pagy", "~> 9.3.4"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

gem "draper", "~> 4.0.4"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "rack-cors", "~> 2.0.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", "~> 7.0.2", require: false
  gem "bundler-audit", "~> 0.9.2", require: false
  gem "bundler-leak", "~> 0.3.0", require: false
  gem "traceroute", "~> 0.8.1", require: false
  gem "rubocop-rails-omakase", require: false
  gem "dotenv-rails", "~> 3.1.8"
  gem "strong_migrations", "~> 2.3.0", require: false
  gem "fasterer", "~> 0.11.0", require: false
end
