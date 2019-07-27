# frozen_string_literal: true

module Hahamut
  module Message
    # Abstract Message
    class Base
      class << self
        def match?(_message)
          false
        end
      end

      include Support::Attributes

      attribute :sender_id, :string

      def initialize(attributes)
        assign_attributes(attributes['message'])
        self.sender_id = attributes['sender_id']
      end
    end
  end
end
