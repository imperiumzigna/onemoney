# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Exchange Currency Process', type: :system, js: true do
  it 'exchange value' do
    visit '/'

    select('EUR', from: 'source_currency')
    select('USD', from: 'target_currency')
    fill_in 'amount', with: rand(1..9999)

    # save_and_open_page
    expect(page).to have_selector('#result')
  end
end
