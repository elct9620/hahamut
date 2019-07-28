# frozen_string_literal: true

RSpec.describe Hahamut::Message::BotStart do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    let(:attributes) do
      {
        start_img: 'example.PNG',
        init: {}
      }
    end
    subject { JSON.parse(message.to_json) }

    it { should include('type' => 'botStart') }
    it { should include('start_img' => 'example.PNG') }
    it { should include('init' => {}) }

    context 'init with BotEvent' do
      pending 'should include init => #<Hahamut::Message::BotEvent>'
    end
  end
end
