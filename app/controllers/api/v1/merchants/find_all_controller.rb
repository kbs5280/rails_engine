class Api::V1::Merchants::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    merchants = Merchant.where(merchant_params)
    respond_with merchants
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end

end
