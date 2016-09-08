#GET /api/v1/items/:id/best_day
#returns the date with the most sales for the given item using the invoice date.
#If there are multiple days with equal number of sales, return the most recent day.
class Api::V1::Items::BestDayController < ApplicationController
respond_to :json, :xml

  def show
    require "pry"; binding.pry
    best_day = Item
    respond_with best_day
  end
end
