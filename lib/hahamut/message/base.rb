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

      attr_reader :sender_id

      # TODO: Improve sender / recipient setup
      def initialize(attributes, sender_id = nil)
        assign_attributes(attributes)
        @sender_id = sender_id
      end

      def type
        raise NotImplementedError
      end

      def as_json(_obj = nil)
        attrs = @attributes.dup
        attrs = attrs.merge(type: type) if type
        attrs
      end

      def to_json(_obj = nil)
        as_json.to_json
      end
    end
  end
end
