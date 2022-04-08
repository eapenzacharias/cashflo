class StaticController < ApplicationController
  def landing
    redirect_to categories_path if signed_in?
  end
end
