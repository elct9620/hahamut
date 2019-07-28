# frozen_string_literal: true

require 'json'

module Hahamut
  # Image Uploader
  class Uploader
    ENDPOINT = 'https://us-central1-hahamut-8888.cloudfunctions.net/' \
               'imagePush?bot_id=%<botid>s' \
               '&access_token=%<token>s'

    def initialize(botid, token)
      @botid = botid
      @token = token
    end

    def upload(path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      create_image http.request(build_request(path))
    end

    def uri
      @uri ||= URI(format(ENDPOINT, botid: @botid, token: @token))
    end

    private

    def build_request(path)
      @request = Net::HTTP::Post.new(uri.request_uri)
      @request['Content-Type'] =
        "multipart/form-data; boundary=#{Rack::Multipart::MULTIPART_BOUNDARY}"
      @request.body = read_file(path)
      @request
    end

    def read_file(path)
      Rack::Multipart::Generator.new(
        filedata: Rack::Multipart::UploadedFile.new(
          path,
          'application/octet-stream'
        )
      ).dump
    end

    def create_image(res)
      pp res.is_a?(Net::HTTPSuccess)
      return false unless res.is_a?(Net::HTTPSuccess)

      Message::Image.new(JSON.parse(res.body))
    end
  end
end
