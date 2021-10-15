class StaticPagesController < ApplicationController
  # ---> controller to handle static pages, 
  # which does not use the standard REST actions
  def home
    # ---> has a corresponding view called `home.html.erb`
    @micropost = current_user.microposts.build if logged_in? 
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
