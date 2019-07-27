# frozen_string_literal: true

module Hahamut
  module Message
    # Command Message
    class Command < Base
      class << self
        def match?(message)
          message['message']&.key?('bot_command')
        end
      end

      attribute :event_id, :string
      attribute :bot_command, :string

      # Unsupport
      def type
        nil
      end
    end
  end
end
