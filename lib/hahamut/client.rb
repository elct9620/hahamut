# frozen_string_literal: true

module Hahamut
  # Hahamut Client
  class Client
    attr_reader :id, :token, :secret

    def initialize(bot_id, token, secret)
      @id = bot_id
      @token = token
      @secret = secret

      Manager.register(self)
    end
  end
end
