class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
        # TODO Tim is going to add code right here
        # cookies in headers emphasis in chrome dev tools Network tab.
        # expire a session
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.email}"
        redirect_to root_path
    else
        flash[:error] = 'Your credentials are bad, and you should feel bad'
        render :new
    end
  end
end
