class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # return false if any value besides nil and false
    if user && user.authenticate(params[:session][:password])
      # success
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
end
