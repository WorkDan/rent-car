class SearchController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end
end