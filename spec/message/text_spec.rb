# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Message::Text do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    let(:attributes) { { text: 'Hello World' } }
    subject { JSON.parse(message.to_json) }

    it { should include('text' => 'Hello World') }
    it { should include('type' => 'text') }
  end

  describe '.match?' do
    let(:message) { {} }
    subject { described_class.match?(message) }

    it { should be_falsy }

    context 'include text' do
      let(:message) do
        {
          'message' => {
            'text' => 'Hello World'
          }
        }
      end

      it { should be_truthy }
    end
  end
end
