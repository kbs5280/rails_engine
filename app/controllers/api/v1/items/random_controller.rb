class Api::V1::Items::RandomController < ApplicationController

  def show
    random_item = Item.find_random
    respond_with random_item
  end
end
