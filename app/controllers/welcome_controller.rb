class WelcomeController < ApplicationController
  before_action :signed_in_user
  def index
  end
  
  private
    def signed_in_user
      redirect_to users_path unless !signed_in?
    end
end