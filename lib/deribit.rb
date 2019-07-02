require "deribit/version"
require "deribit/immutable_header_key"
require "deribit/error"
require "deribit/request"
require "deribit/api"
require "deribit/ws"
require "deribit/ws/handler"

module Deribit
  Credentials = Struct.new(:api_key, :api_secret)
end
