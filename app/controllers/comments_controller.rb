class CommentsController < ApplicationController
   def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
       
        # if @comment.update(comment_params)
    if @comment.update(params.require(:comment).permit(:body))
      redirect_to post_path(@post)
    else
      render :edit
    end
    
  end
  
end
