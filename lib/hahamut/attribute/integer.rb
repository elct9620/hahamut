# frozen_string_literal: true

module Hahamut
  module Attribute
    # Integer Type
    class Integer < Base
      def value
        @value ||= before_cast.to_i
      end
    end
  end
end
