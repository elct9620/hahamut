# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hahamut::Sender do
  let(:token) { 'fake-token' }
  let(:sender) { described_class.new(token) }

  describe '#send' do
    let(:recipient) { 'example' }
    let(:response) { double(Net::HTTPSuccess) }
    let(:message) { Hahamut::Message::Text.new(text: 'Hi!') }

    subject { sender.send(recipient, message) }

    # TODO: Message body should be tested
    it 'create a post request' do
      expect_any_instance_of(Net::HTTP).to receive(:request)
        .with(kind_of(Net::HTTP::Post))
        .and_return(response)
      subject
    end
  end
end
