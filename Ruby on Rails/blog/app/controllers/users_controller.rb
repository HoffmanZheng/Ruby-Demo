class UsersController < ApplicationController

  # pre-filter
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]    # 必须先登录才能修改
  before_action :correct_user, only: [:edit, :update]    # 只能修改自己的信息
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
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
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private  # Every instance method after private becomes a private method.
    def user_params
      # throw exception if :user element does not exist
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end 
end
