# frozen_string_literal: true

require 'singleton'

module Hahamut
  # Hahamut Engine
  class Engine
    include Singleton

    class << self
      def call(env)
        Handler.new(env).process
      end
    end
  end
end
