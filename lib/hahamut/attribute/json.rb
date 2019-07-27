# frozen_string_literal: true

module Hahamut
  module Attribute
    # JSON Attribute
    class Json < Base
      def value
        @value ||= before_cast.as_json if before_cast.respond_to?(:as_json)
        @value ||= before_cast if before_cast.is_a?(Hash)
        @value ||= {}
      end
    end
  end
end
