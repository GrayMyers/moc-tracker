class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)

    # using &. is a shortcut for (user && user.authenticate(...))
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}"
      redirect_to root_path
    else
      flash[:error] = 'Your credentials are bad, and you should feel bad'
      render :new
    end
  end
end
