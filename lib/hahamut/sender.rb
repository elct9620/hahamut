# frozen_string_literal: true

require 'net/http'

module Hahamut
  # Chat Message Sender
  class Sender
    ENDPOINT = 'https://us-central1-hahamut-8888.cloudfunctions.net/' \
               'messagePush?access_token=%<token>s'

    def initialize(token)
      @token = token
    end

    def uri
      @uri ||= URI(format(ENDPOINT, token: @token))
    end

    def ssl?
      uri.scheme == 'https'
    end

    def send(recipient, message)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = ssl?
      http.request build_request(recipient, message)
    end

    private

    def build_request(recipient, message)
      @request = Net::HTTP::Post.new(uri)
      @request['Content-Type'] = 'application/json'
      @request.body = {
        recipient: { id: recipient },
        message: message
      }.to_json
      @request
    end
  end
end
