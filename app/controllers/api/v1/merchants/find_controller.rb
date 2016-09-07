class Api::V1::Merchants::FindController < ApplicationController
  before_action :downcase_params
  respond_to :json, :xml

  # def index
  #   merchants = Merchant.where(merchant_params)
  #   respond_with merchants
  # end

  def show
    merchant = Merchant.find_by(merchant_params)
    respond_with merchant
  end

  private

    def downcase_params
      params[:name] = params[:name].downcase if params[:name]
    end

    def merchant_params
      params.require(:merchant).permit(:name, :created_at, :updated_at)
    end
end
