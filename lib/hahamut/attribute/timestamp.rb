# frozen_string_literal: true

module Hahamut
  module Attribute
    # Timestamp Attribute
    class Timestamp < Base
      def value
        @value ||= Time.at(before_cast.to_i / 1000)
      end
    end
  end
end
