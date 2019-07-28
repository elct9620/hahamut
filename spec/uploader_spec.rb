# frozen_string_literal: true

require 'spec_helper'
require 'tempfile'

RSpec.describe Hahamut::Uploader do
  let(:bot_id) { 'bot@666' }
  let(:token) { 'fake-token' }
  let(:sender) { described_class.new(bot_id, token) }

  describe '#send' do
    let(:file) { Tempfile.new }
    let(:path) { file.path }
    let(:response) { double(Net::HTTPSuccess) }
    let(:json) do
      {
        id: 'example',
        ext: 'PNG',
        width: 128,
        height: 128
      }.to_json
    end

    subject { sender.upload(path) }

    before do
      allow_any_instance_of(Net::HTTP).to receive(:request)
        .with(kind_of(Net::HTTP::Post))
        .and_return(response)
      allow(response).to receive(:is_a?).with(Net::HTTPSuccess).and_return(true)
      allow(response).to receive(:body).and_return(json)
    end

    it { should be_kind_of(Hahamut::Message::Image) }
  end
end
