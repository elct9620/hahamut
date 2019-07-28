# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Event do
  let(:time) { Time.now }
  let(:messages) { [] }
  let(:raw) do
    {
      'botid' => 'bot@666',
      'time' => (time.to_f * 1000).to_i,
      'messaging' => messages
    }
  end

  let(:event) { described_class.new(raw) }

  describe '#botid' do
    subject { event.botid }

    it { should eq('bot@666') }
  end

  describe '#time' do
    # Ruby support nsec, but Hahamut not supported
    subject { event.time.to_i }

    it { should eq(time.to_i) }
  end

  describe '#messaging' do
    let(:messages) do
      [
        {
          'message' => {
            'text' => 'Hello World'
          }
        }
      ]
    end

    subject { event.messaging }

    it { should include(kind_of(Hahamut::Message::Text)) }
  end
end
