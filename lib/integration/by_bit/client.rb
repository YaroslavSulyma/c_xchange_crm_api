module Integration
  module ByBit
    class Client < BaseClient
      include Singleton

      BASE_API_URL = ENV.fetch("BY_BIT_BASE_URL")
      API_KEY = ENV.fetch("BY_BIT_API_KEY")
      RECV_WINDOW = ENV.fetch("BY_BIT_RECV_WINDOW", "5000")
      SECRET_KEY = ENV.fetch("BY_BIT_API_SECRET")

      def self.instance
        @instance ||= new(base_url: BASE_API_URL, default_headers: build_headers)
      end

      def self.build_headers
        {
          "Content-Type" => "application/json",
          "X-BAPI-API-KEY" => API_KEY,
          "X-BAPI-TIMESTAMP" => current_timestamp,
          "X-BAPI-RECV-WINDOW" => RECV_WINDOW
        }
      end

      def self.gen_signature(payload)
        param_str = current_timestamp + API_KEY + RECV_WINDOW + payload
        OpenSSL::HMAC.hexdigest("sha256", SECRET_KEY, param_str)
      end

      def self.current_timestamp
        (Time.now.to_f * 1000).to_i.to_s
      end
    end
  end
end
