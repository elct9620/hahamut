# frozen_string_literal: true

module Hahamut
  module Attribute
    # Base value
    class Base
      attr_reader :before_cast

      def initialize(value)
        @before_cast = value
      end

      def value
        @value ||= before_cast
      end

      def as_json
        value
      end

      def to_json(_obj = nil)
        as_json.to_json
      end
    end
  end
end
