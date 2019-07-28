# frozen_string_literal: true

module Hahamut
  # Signature Verifier
  class Signature
    def initialize(secret, body)
      @secret = secret
      @body = body
    end

    def match?(signature)
      signature == "sha1=#{sign}"
    end

    def sign
      @sign ||= OpenSSL::HMAC.hexdigest('SHA1', @secret, @body)
    end
  end
end
