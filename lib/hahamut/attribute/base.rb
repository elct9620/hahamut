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
    end
  end
end
