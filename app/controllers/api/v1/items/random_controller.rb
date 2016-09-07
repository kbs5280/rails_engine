class Api::V1::Items::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random_item = Item.find_random_item
    respond_with random_item
  end
end
