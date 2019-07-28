# frozen_string_literal: true

RSpec.describe Hahamut::Message::Command do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    subject { JSON.parse(message.to_json) }

    it { should_not include('type') }
  end

  describe '.match?' do
    let(:message) { {} }
    subject { described_class.match?(message) }

    it { should be_falsy }

    context 'include bot_command' do
      let(:message) do
        {
          'message' => {
            'bot_command' => 'Hello World'
          }
        }
      end

      it { should be_truthy }
    end
  end
end
