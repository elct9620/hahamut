# frozen_string_literal: true

require 'singleton'

module Hahamut
  # Client Manager
  class Manager
    include Singleton

    class << self
      def register(client)
        instance.register(client)
      end

      def find(id)
        instance.get(id)
      end

      def handle(client, event)
        instance.handler&.call(client, event)
      end
    end

    attr_accessor :handler

    def initialize
      @clients = {}
    end

    def register(args)
      case args
      when Hash then client = create_from(args)
      when Client then client = args
      end

      @clients[client.id] = client
    end

    def get(id)
      @clients[id]
    end

    def on_message(&block)
      @handler = block
    end

    private

    def create_from(args)
      Client.new(
        args[:bot_id],
        args[:token],
        args[:secret]
      )
    end
  end
end
