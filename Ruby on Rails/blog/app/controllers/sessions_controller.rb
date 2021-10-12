class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # return false if any value besides nil and false
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user   # rails turn that into user_url(user) automatically
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # different to `redirect_to`, render after flash doesn't disappear the flash info
      # becouse `redirect_to` is a fresh new request, whereas render is not
      # `flash.now` is user for flash on the new rended page, which disappear in the next request
      render 'new'
    end
  end

  def destroy
  end

  # return user if in the session
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
end
