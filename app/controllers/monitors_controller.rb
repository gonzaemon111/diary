class MonitorsController < ApplicationController
  def index
    head :ok
  end

  private

  def devise_controller?
    false
  end
end
