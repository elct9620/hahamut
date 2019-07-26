# frozen_string_literal: true

module Hahamut
  # Signature Verifier
  class Signature
    def initialize(secret, body)
      @secret = secret
      @body = body
    end

    def match?(verify_signature)
      signature == verify_signature
    end

    def signature
      "sha1=#{OpenSSL::HMAC.hexdigest('SHA1', @secret, @body)}"
    end
  end
end
