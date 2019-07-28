# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Manager do
  describe '.register' do
    let(:client) { Hahamut::Client.new('bot@666', 'token', 'secret') }
    subject { described_class.register(client) }

    it { should eq(client) }

    context 'with hash' do
      let(:client) do
        {
          bot_id: 'bot@666',
          token: 'fake-token',
          secret: 'fake-secret'
        }
      end

      it { should be_kind_of(Hahamut::Client) }
    end
  end

  describe '.find' do
    let(:id) { 'bot@999' }
    subject { described_class.find(id) }

    it { should be_nil }

    context 'registered bot id' do
      before { Hahamut::Client.new(id, 'token', 'secret') }

      it { should_not be_nil }
    end
  end

  describe '.handle' do
    let(:time) { Time.now }
    let(:messages) { [] }
    let(:raw) do
      {
        'botid' => 'bot@666',
        'time' => (time.to_f * 1000).to_i,
        'messaging' => messages
      }
    end

    let(:client) { Hahamut::Client.new('bot@666', 'token', 'secret') }
    let(:event) { Hahamut::Event.new(raw) }

    subject { described_class.handle(client, event) }

    it { should be_nil }

    context 'configured handler by #on_ message' do
      before { described_class.instance.on_message { |_client, _evnet| true } }

      it { should be_truthy }
    end

    context 'configured handler by #handler=' do
      let(:handler) { double(Object) }
      before do
        allow(handler).to receive(:call).and_return(true)
        described_class.instance.handler = handler
      end

      it { should be_truthy }
    end
  end
end
