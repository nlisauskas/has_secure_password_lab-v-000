class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    if session[:name]
      session.clear
      redirect_to '/'
    end
  end

end
