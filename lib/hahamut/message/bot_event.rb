# frozen_string_literal: true

module Hahamut
  module Message
    # Bot Start Message
    class BotEvent < Base
      # TODO: Implement image attribute
      attribute :image, :string
      # TODO: Implement specify attribute
      attribute :hp, :json
      attribute :text, :json
      attribute :button, :json

      def type
        :botEvent
      end
    end
  end
end
