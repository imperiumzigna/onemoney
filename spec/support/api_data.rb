# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /currencydatafeed.com/)
      .with(headers: {
              'Accept' => '*/*'
            }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "3.41325",
                "date": "2018-04-20 17:22:59",
                "type": "original"
            }
        ]
      }', headers: {})
    stub_request(:get, /min-api.cryptocompare.com/)
      .with(headers: {
              'Accept' => '*/*'
            }).to_return(status: 200, body: '
      {
        "status": true,
        "USD":  7737.99,
        "JPY": 852661.59,
        "EUR": 6942.83
      }', headers: {})
  end
end
