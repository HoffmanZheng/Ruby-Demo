class UsersController < ApplicationController

  # pre-filter
  before_action :logged_in_user, only: [:edit, :update]    # 必须先登录才能修改
  before_action :correct_user, only: [:edit, :update]    # 只能修改自己的信息

  def logged_in_user
    unless logged_in?
      store_location   # 需要拦截的页面，存储原始页面，供登录后跳转使用
      flash[:danger] = "Please log in."
      redirect_to login_url
    end 
  end

  def correct_user 
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
    # TODO: 可以抽取 current_user? 到 sessions_helper 中
  end

  def new
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # show in the subsequent page, but disappear further visit another page or refresh
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # success
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      # 提交的数据无效时，需要重新渲染页面
      render 'edit'
    end 
  end

  def destroy

  end

  private
    def user_params
      # throw exception if :user element does not exist
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
