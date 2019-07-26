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
    end

    def initialize
      @clients = {}
    end

    def register(client)
      @clients[client.id] = client
    end

    def get(id)
      @clients[id]
    end
  end
end
