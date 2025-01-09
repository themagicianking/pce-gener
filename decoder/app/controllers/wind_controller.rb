class WindController < ApplicationController
  def index
    @wind = Wind.all
  end
end
