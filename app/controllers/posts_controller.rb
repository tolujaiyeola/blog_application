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
    @post= current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

    @favourite = @post.favourite_for(current_user) if user_signed_in?
    @comment = Comment.new
    # @comments = @post.comments.all
    @comments = @post.comments.order(created_at: :desc)
    @category = Category.find(params[:id])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # if @post.update(params.require(:post).permit(:title, :body))
    if @post.update(post_params)
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

  private

  def post_params
    # This uses a feature called "Strong Parameters" introduced
    # to Rails by version 4. It makes you be explicit about
    # the parameters you want the user to be able to create/edit.
    # in the case below I'm requireing that there is a key
    # called question and inside I'm allowing only :title and :body
    # parameters to be created
    params.require(:post).permit(:title, :body, {category_ids: []})
  end
end
