# frozen_string_literal: true

module Hahamut
  module Message
    # Bot Start Message
    class BotStart < Base
      # TODO: Implement image attribute
      attribute :start_img, :string
      attribute :init, :json

      def type
        :botStart
      end
    end
  end
end
