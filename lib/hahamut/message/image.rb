# frozen_string_literal: true

module Hahamut
  module Message
    # Image Message
    class Image < Base
      attribute :id, :string
      attribute :ext, :string
      attribute :width, :integer
      attribute :height, :integer

      def type
        :img
      end
    end
  end
end
