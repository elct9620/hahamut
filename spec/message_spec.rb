# frozen_string_literal: true

RSpec.describe Hahamut::Message do
  describe '.types' do
    subject { described_class.types }

    [
      Hahamut::Message::Text,
      Hahamut::Message::Image,
      Hahamut::Message::Command,
      Hahamut::Message::Sticker,
      Hahamut::Message::BotStart,
      Hahamut::Message::BotEvent
    ].each { |type| it { should include(type) } }
  end

  describe '.parse' do
    let(:message) { {} }
    subject { described_class.parse(message) }

    it { should be_nil }

    context 'text message' do
      let(:message) do
        {
          'sender_id' => 'example',
          'message' => {
            'text' => 'Hello World'
          }
        }
      end

      it { should be_kind_of(Hahamut::Message::Text) }
    end
  end
end
