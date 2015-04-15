class PostsController < ApplicationController

  before_action :authenticate_user!
  

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))

    # using current_user.posts.new instead of Post.new
    # makes the instantiated post associated with the current_user
    @post= current_user.posts.new(params.require(:post).permit(:title, :body))
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @comments = @post.comments.all
    @comments = @post.comments.order(created_at: :desc)

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :body))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
end
