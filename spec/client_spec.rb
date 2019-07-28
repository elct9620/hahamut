# frozen_string_literal: true

require 'spec_helper'
require 'tempfile'

RSpec.describe Hahamut::Client do
  let(:bot_id) { 'bot@666' }
  let(:token) { 'fake-token' }
  let(:secret) { 'fake-secret' }

  let(:client) { described_class.new(bot_id, token, secret) }

  let(:json) { {} }
  let(:response) { double(Net::HTTPSuccess) }

  before do
    allow_any_instance_of(Net::HTTP).to receive(:request)
      .with(kind_of(Net::HTTP::Post))
      .and_return(response)
    allow(response).to receive(:is_a?).with(Net::HTTPSuccess).and_return(true)
    allow(response).to receive(:kind_of?)
      .with(Net::HTTPSuccess).and_return(true)
    allow(response).to receive(:body).and_return(json)
  end

  describe '#send_to' do
    subject { client.send_to('example', {}) }

    it { should be_kind_of(Net::HTTPSuccess) }
  end

  describe '#upload' do
    let(:file) { Tempfile.new }
    let(:json) do
      {
        id: 'example',
        ext: 'PNG',
        width: 128,
        height: 128
      }.to_json
    end
    subject { client.upload(file.path) }

    it { should be_kind_of(Hahamut::Message::Image) }
  end
end
