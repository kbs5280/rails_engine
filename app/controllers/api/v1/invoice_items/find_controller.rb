class Api::V1::InvoiceItems::FindController < ApplicationController
  before_action :sanitize_unit_price
  respond_to :json, :xml

  def index
    invoice_items = InvoiceItem.where(invoice_items_params)
    respond_with invoice_items
  end

  def show
    invoice_items = InvoiceItem.find_by(invoice_items_params)
    respond_with invoice_items
  end

  private

    def invoice_items_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end

    def sanitize_unit_price
      if params[:unit_price] && params[:unit_price].include?(".")
        params[:unit_price] = params[:unit_price].delete"."
      end
    end
end
