module Integration
  class BaseClient
    Result = Struct.new(:success?, :status_code, :body, :headers, keyword_init: true)

    attr_reader :base_url, :default_headers

    def initialize(base_url:, default_headers: {})
      @base_url = base_url
      @default_headers = default_headers.symbolize_keys
    end

    def make_request(method:, path:, params: {}, headers: {})
      response = connection.public_send(method, path, params, default_headers.merge(headers))
      Result.new(
        success?: true,
        status_code: response.status,
        body: parse_response_body(response.body),
        headers: response.headers
      )
    rescue Faraday::ClientError => e
      handle_client_error(e)
    rescue StandardError => e
      handle_generic_error(e)
    end

    private

    def parse_response_body(body)
      Oj.load(body, symbol_keys: true)
    rescue Oj::ParseError => e
      Rails.logger.warn("JSON parse error: #{e.message}")
      { error: "Failed to parse JSON response" }
    end

    def handle_client_error(error)
      Rails.logger.error("Client error (#{error.class}): #{error.message}")
      body = error.response[:body].presence && parse_response_body(error.response[:body])
      Result.new(success?: false, status_code: error.response[:status], body: body || { error: error.message })
    end

    def handle_generic_error(error)
      Rails.logger.error("Unexpected error (#{error.class}): #{error.message}")
      Result.new(success?: false, status_code: 500, body: { error: error.message })
    end

    def connection
      @connection ||= Faraday.new(url: base_url) do |faraday|
        faraday.use Faraday::Response::RaiseError
        faraday.request :url_encoded
        faraday.headers = default_headers
        faraday.response :logger, Rails.logger, headers: true, bodies: true, errors: true
      end
    end
  end
end
