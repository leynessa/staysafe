class AboutsController < ApplicationController
  skip_after_action :verify_authorized
  def index
  end
end
