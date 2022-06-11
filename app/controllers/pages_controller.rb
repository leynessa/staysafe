class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
    redirect_to incidents_path if user_signed_in?
  end

end
