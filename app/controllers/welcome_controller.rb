class WelcomeController < ApplicationController

  def home
    @user = User.find_by(session[:user_id])
  end


end
