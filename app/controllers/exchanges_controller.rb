# frozen_string_literal: true

class ExchangesController < ApplicationController
  def index; end

  def convert
    value = CryptoService.new(params[:source_currency],
                                params[:target_currency],
                                params[:amount]).perform
    render json: { 'converted': value }
  end
end
