# frozen_string_literal: true

module Hahamut
  module Attribute
    # String Type
    class String < Base
      def value
        @value ||= before_cast.to_s
      end
    end
  end
end
