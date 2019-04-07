require_relative '../monads/searchs'

class SearchController < ApplicationController
  def index
    result = ::Searchs::Index::Action.new.call(params: params)

    if result.success?
      @vehicles = result.value!
    else
      redirect_back(fallback_location: root_path)
    end
  end
end