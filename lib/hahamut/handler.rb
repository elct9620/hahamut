# frozen_string_literal: true

require 'rack'
require 'json'

module Hahamut
  # Handling HTTP Request
  class Handler
    SIGNATURE_HEADER = 'HTTP_X_BAHA_DATA_SIGNATURE'

    attr_reader :request, :response

    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def process
      return invalid_client if client.nil?
      return invalid_signature unless valid_signature?

      Manager.handle(client, Event.new(body))

      Rack::Response.new([], 204)
    end

    def body
      @body ||= JSON.parse(raw)
    end

    def client
      Manager.find(body['botid'])
    end

    def raw
      return @raw unless @raw.nil?

      @raw = @request.body.read
      @request.body.rewind
      @raw
    end

    private

    def invalid_signature
      Rack::Response.new([], 401)
    end

    def invalid_client
      Rack::Response.new([], 404)
    end

    def valid_signature?
      return false unless @request.has_header?(SIGNATURE_HEADER)

      signature = @request.get_header(SIGNATURE_HEADER)
      Signature.new(client.secret, raw).match?(signature)
    end
  end
end
