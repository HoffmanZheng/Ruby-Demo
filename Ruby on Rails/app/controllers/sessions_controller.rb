class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # return false if any value besides nil and false
    if user && user.authenticate(params[:session][:password])
      log_in user
      # 根据用户是否勾选 '记住我' 复选框，进行持久会话的逻辑
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # redirect_to user   # rails turn that into user_url(user) automatically
      redirect_back_or user  # 登录后跳转到原始页面
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # different to `redirect_to`, render after flash doesn't disappear the flash info
      # becouse `redirect_to` is a fresh new request, whereas render is not
      # `flash.now` is user for flash on the new rended page, which disappear in the next request
      render 'new'
    end
  end

  def destroy
    # 防止用户开多个窗口，然后第二次退出报错的问题
    log_out if logged_in?  
    redirect_to root_url
  end

  
end
