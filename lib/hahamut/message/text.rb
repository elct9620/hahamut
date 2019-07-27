# frozen_string_literal: true

module Hahamut
  module Message
    # Text Message
    class Text < Base
      class << self
        def match?(message)
          message['message']&.key?('text')
        end
      end

      attribute :text, :string
    end
  end
end
