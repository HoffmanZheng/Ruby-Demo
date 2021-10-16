class StaticPagesController < ApplicationController
  # ---> controller to handle static pages, 
  # which does not use the standard REST actions
  def home
    # ---> has a corresponding view called `home.html.erb`
    # 如果用户已登录，将展示他发表的微博
    if logged_in?
      @micropost = current_user.microposts.build    # 在首页可以编辑发表微博ß
      @feed_items = current_user.feed.paginate(page: params[:page])
    end 
  end
  # ---> in plain Ruby, these methods would simple do nothing
  # in Rails is different because the StaticPagesController 
  # inherit from ApplicationController,
  def help
  end
  def about
  end
  # ---> extract the repetition in the code

  def contact
  end
end
