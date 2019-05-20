# frozen_string_literal: true

require 'rest-client'
require 'json'

# Exchange Service
class ExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    res = RestClient.get url
    value = JSON.parse(res.body)['currency'][0]['value'].to_f

    value * @amount
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end

  private

  def exchange_api_key
    Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
  end

  def exchange_api_url
    Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
  end

  def url
    "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
  end
end
