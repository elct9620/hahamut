# frozen_string_literal: true

RSpec.describe Hahamut::Message::Sticker do
  let(:attributes) { {} }
  let(:message) { described_class.new(attributes) }

  describe '#to_json' do
    let(:attributes) do
      {
        sticker_group: 25,
        sticker_id: '01'
      }
    end
    subject { JSON.parse(message.to_json) }

    it { should include('type' => 'sticker') }
    it { should include('sticker_group' => '25') }
    it { should include('sticker_id' => '01') }
  end

  describe '.match?' do
    let(:message) { {} }
    subject { described_class.match?(message) }

    it { should be_falsy }

    context 'include sticker_group' do
      let(:message) do
        {
          'message' => {
            'sticker_group' => '25',
            'sticker_id' => '01'
          }
        }
      end

      it { should be_truthy }
    end
  end
end
