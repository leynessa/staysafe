class SecondhomeController < ApplicationController
  def home
    redirect_to incidents_path if user_signed_in?
  end
end
