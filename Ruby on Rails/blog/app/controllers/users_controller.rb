class UsersController < ApplicationController
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
