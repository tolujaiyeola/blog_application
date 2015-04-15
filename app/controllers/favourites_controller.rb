class FavouritesController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @favourited_posts = current_user.favourited_posts
  # end
  #
  #
  # def create
  #   # post = Post.find(params[:post_id])
  #   # favourite = current_user.favourites.new
  # end
  #
  # def destroy
  #
  # end

  def index
    @favourited_posts = current_user.favourited_posts
  end

  def create
    post  = Post.find params[:post_id]
    favourite = current_user.favourites.new
    favourite.post = post
    if favourite.save
      redirect_to post, notice: "Favourited!"
    else
      # redirect_to something
      # if the something is a ActiveRecord object
      # Rails will redirect to the assiciated controller show action
      # for instance if teh objecet is post it will redirect to post_path(post)
      # in this case it will redirect to post_path(post)
      redirect_to post, alert: "Not Favourited! It may be already in your favourites"
    end
  end

  def destroy
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to favourite.post, notice: "UnFavourited"
  end


end
