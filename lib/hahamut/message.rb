# frozen_string_literal: true

require 'hahamut/message/base'
require 'hahamut/message/text'
require 'hahamut/message/image'
require 'hahamut/message/sticker'
require 'hahamut/message/command'
require 'hahamut/message/bot_start'
require 'hahamut/message/bot_event'

module Hahamut
  # Hahamut Message
  module Message
    class << self
      def types
        @types ||= (constants - [:Base]).map { |name| const_get(name) }
      end

      def parse(message)
        # TODO: Improve type match
        klass = types.find { |type| type.match?(message) }
        klass&.new(message['message'], message['sender_id'])
      end
    end
  end
end
