# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Signature do
  let(:secret) { 'example' }
  let(:body) { { botid: 'bot@666' }.to_json }
  let(:signed_body) { OpenSSL::HMAC.hexdigest('sha1', secret, body) }
  let(:signature) { described_class.new(secret, body) }

  describe '#sign' do
    subject { signature.sign }

    it { should eq(signed_body) }
  end

  describe '#match?' do
    let(:sign) { "sha1=#{signed_body}" }
    subject { signature.match?(sign) }

    it { should be_truthy }
  end
end
