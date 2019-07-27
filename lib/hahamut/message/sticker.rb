# frozen_string_literal: true

module Hahamut
  module Message
    # Sticker Message
    class Sticker < Base
      class << self
        def match?(message)
          message['message']&.key?('sticker_group')
        end
      end

      attribute :sticker_group, :string
      attribute :sticker_id, :string

      def type
        :sticker
      end
    end
  end
end
