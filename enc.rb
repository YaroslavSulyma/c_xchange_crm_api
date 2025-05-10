require 'digest'
require "uri"
require "net/http"
require "date"
require 'open-uri'
require 'openssl'
require 'securerandom'
require 'json'

$api_key = 'rY78p6ol5sJ5INzwTu'
$secret_key = 'kFfeyJNoilkB2311vD9ZJyhWsnuREL58sfOp'
$recv_window = '5000'
$url = URI("https://api.bybit.com")
$time_stamp = ""

def HTTP_Request(endPoint, method, payload)
  $time_stamp = DateTime.now.strftime('%Q')
  signature = genSignature(payload)
  fullUrl = $url + endPoint
  if method == "POST"
    request = Net::HTTP::Post.new(fullUrl, 'Content-Type' => 'application/json')
    request.body = payload
  elsif method == "GET"
    payload = "?" + payload
    fullUrl = $url + endPoint + payload
    request = Net::HTTP::Get.new(fullUrl)
  else
    puts "Check the method. It should be either GET or POST"
    exit
  end
  https = Net::HTTP.new(fullUrl.host, fullUrl.port)
  # https.set_debug_output($stdout)
  https.use_ssl = true
  request["X-BAPI-API-KEY"] = $api_key
  request["X-BAPI-TIMESTAMP"] = $time_stamp
  request["X-BAPI-RECV-WINDOW"] = $recv_window
  request["X-BAPI-SIGN"] = signature
  response = https.request(request)
  JSON.parse(response.body)
end

def genSignature(payload)
  param_str = $time_stamp + $api_key + $recv_window + payload
  OpenSSL::HMAC.hexdigest('sha256', $secret_key, param_str)
end

# #Retrieve Unfilled Orders ( GET Method )
# endPoint = "/v5/p2p/user/personal/info"
# method = "POST"
# payload=''
# HTTP_Request(endPoint,method,payload)

# Retrieve Unfilled Orders ( GET Method )
endPoint = "/v5/p2p/order/simplifyList"
method = "POST"
payload = '{ "page": 1, "size": 30, "side": 0, "status": 50, "beginTime": 1746565200000, "endTime": 1746737999999 }'
result = HTTP_Request(endPoint, method, payload)
amounts = result.dig("result", "items")&.map { |r| r["amount"].to_f } || []
puts "Total amount: #{amounts.sum}"
# # Retrieve Unfilled Orders ( GET Method )
# endPoint = "/v5/p2p/order/info/1912407315639324672"
# method = "POST"
# payload = ''
# HTTP_Request(endPoint, method, payload)
