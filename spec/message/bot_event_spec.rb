# frozen_string_literal: true

RSpec.describe Hahamut::Message::BotEvent do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    let(:attributes) do
      {
        event_id: 'event0000',
        image: 'example.PNG',
        hp: {},
        text: {},
        button: {}
      }
    end
    subject { JSON.parse(message.to_json) }

    it { should include('type' => 'botEvent') }
    it { should include('event_id' => 'event0000') }
    it { should include('image' => 'example.PNG') }
    it { should include('hp' => {}) }
    it { should include('text' => {}) }
    it { should include('button' => {}) }

    context 'hp is Event::Hp' do
      pending 'should include init => #<Hahamut::Message::Event::Hp>'
    end

    context 'text is Event::Text' do
      pending 'should include init => #<Hahamut::Message::Event::Text>'
    end

    context 'button is Event::Button' do
      pending 'should include init => #<Hahamut::Message::Event::Button>'
    end
  end
end
