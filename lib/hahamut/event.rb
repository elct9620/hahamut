# frozen_string_literal: true

module Hahamut
  # Hahamut Webhook Event
  class Event
    include Support::Attributes

    attribute :botid, :string
    attribute :time, :timestamp

    def initialize(attributes)
      assign_attributes(attributes)

      @attributes[:messaging] ||= []
    end

    def messaging
      @attributes[:messaging]
    end

    def messaging=(messages)
      @attributes[:messaging] =
        messages
        &.map { |message| Message.parse(message) }
        &.compact
    end
  end
end
