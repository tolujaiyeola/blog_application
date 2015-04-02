class CommentsController < ApplicationController
   def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    end
  end
end
