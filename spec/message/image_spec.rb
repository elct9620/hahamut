# frozen_string_literal: true

RSpec.describe Hahamut::Message::Image do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    let(:attributes) do
      {
        id: 'dummy',
        ext: 'PNG',
        width: 128,
        height: 128
      }
    end

    subject { JSON.parse(message.to_json) }

    it { should include('type' => 'img') }
    it { should include('id' => 'dummy') }
    it { should include('ext' => 'PNG') }
    it { should include('width' => 128) }
    it { should include('height' => 128) }
  end
end
