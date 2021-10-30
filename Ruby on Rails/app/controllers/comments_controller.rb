class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        # ---> `@article.comments` will automatically link the comment
        # so that if belongs to that particular article
        @comment = @article.comments.create(comment_params)
        # save?
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end
end
