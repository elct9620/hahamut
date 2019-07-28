# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Handler do
  let(:request) { double(Rack::Request) }
  let(:handler) { described_class.new({}) }
  let(:raw) { {}.to_json }
  let(:body) { StringIO.new(raw) }

  before do
    allow(Rack::Request).to receive(:new).and_return(request)
    allow(request).to receive(:body).and_return(body)
  end

  describe '#raw' do
    subject { handler.raw }

    it { should eq(raw) }
  end

  describe '#body' do
    subject { handler.body }

    it { should eq({}) }
  end

  describe '#client' do
    let(:bot_id) { 'bot@777' }
    let(:raw) do
      {
        botid: bot_id
      }.to_json
    end

    subject { handler.client }

    it { should be_nil }

    context 'client exists' do
      before { Hahamut::Client.new(bot_id, 'token', 'secret') }

      it { should be_kind_of(Hahamut::Client) }
    end
  end

  describe '#process' do
    let(:bot_id) { 'bot@111' }
    let(:raw) do
      {
        botid: bot_id
      }.to_json
    end

    let(:signature) { "sha1=#{OpenSSL::HMAC.hexdigest('SHA1', 'secret', raw)}" }

    before do
      Hahamut::Client.new(bot_id, 'token', 'secret')
      allow(request).to receive(:has_header?).and_return(true)
      allow(request).to receive(:get_header).and_return(signature)
    end

    subject { handler.process }

    it { should be_kind_of(Rack::Response) }
    it { should be_no_content }

    context 'client not exists' do
      let(:raw) do
        {
          botid: 'empty'
        }.to_json
      end

      it { should be_not_found }
    end

    context 'signature invalid' do
      let(:signature) { 'invalid' }

      it { should be_unauthorized }
    end
  end
end
