# frozen_string_literal: true

require 'rest-client'
require 'json'

# crypto Service
class CryptoService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    res = RestClient.get url
    value = JSON.parse(res.body)[@target_currency].to_f
    value * @amount
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end

  private

  def crypto_api_key
    Rails.application.credentials[Rails.env.to_sym][:crypto_api_key]
  end

  def crypto_api_url
    Rails.application.credentials[Rails.env.to_sym][:crypto_api_url]
  end

  def url
    "#{crypto_api_url}&api_key=#{crypto_api_key}&fsym=#{@source_currency}&tsyms=#{@target_currency}"
  end
end
