# frozen_string_literal: true

require 'spec_helper'
require './app/services/crypto_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999)
    res = CryptoService.new('BTC', 'USD', amount).perform
    expect(res.is_a?(Numeric)).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end
