JWTSessions.encryption_key = ENV.fetch("JWT_SECRET")

JWTSessions.token_store = if Rails.env.production? || Rails.env.staging?
                            [ :redis,
                             {
                               redis_host: ENV.fetch("REDIS_HOST"),
                               redis_port: ENV.fetch("REDIS_PORT"),
                               redis_db_name: "0",
                               token_prefix: "jwt_",
                               pool_size: Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
                             }
                            ]
else
                            :memory
end

JWTSessions.access_exp_time = ENV.fetch("JWT_TOKEN_EXP")
JWTSessions.refresh_exp_time = ENV.fetch("JWT_REFRESH_TOKEN_EXP")
