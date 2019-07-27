# frozen_string_literal: true

module Hahamut
  # Hahamut Client
  class Client
    attr_reader :id, :token, :secret, :sender, :uploader

    def initialize(bot_id, token, secret)
      @id = bot_id
      @token = token
      @secret = secret
      @sender = Sender.new(@token)
      @uploader = Uploader.new(@id, @token)

      Manager.register(self)
    end

    def send_to(recipient, message)
      @sender.send(recipient, message)
    end

    def upload(path)
      @uploader.upload(path)
    end
  end
end
