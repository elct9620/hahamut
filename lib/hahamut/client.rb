# frozen_string_literal: true

module Hahamut
  # Hahamut Client
  class Client
    attr_reader :id, :token, :secret, :sender

    def initialize(bot_id, token, secret)
      @id = bot_id
      @token = token
      @secret = secret
      @sender = Sender.new(@token)

      Manager.register(self)
    end

    def send(message)
      @sender.send(message)
    end
  end
end
