class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :micropost_owner, only: :destroy

    def create
        @micropost = current_user.microposts.build(micropost_params)
        # attach image to micropost when creation
        @micropost.image.attach(params[:micropost][:image])
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            # 提交失败时，回首页需要继续展示 feed_items
            # ---> 提交失败后 params[:page] 为 nil，导致网站出错
            @feed_items = current_user.feed.paginate(params[:page])
            render 'static_pages/home' 
        end
    end

    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        # `request.referrer` 把用户重定向到发起删除请求的页面，为空就到首页
        redirect_to request.referrer || root_url
    end


    private 
        def micropost_params
            params.require(:micropost).permit(:content, :image)
        end

        def micropost_owner
            @micropost = current_user.microposts.find_by(id: params[:id])
            redirect_to root_url if @micropost.nil?
        end
end
