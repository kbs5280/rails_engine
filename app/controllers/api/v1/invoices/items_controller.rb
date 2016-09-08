class Api::V1::Invoices::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    items = Invoice.find(params[:id]).items
    respond_with items
  end
end
