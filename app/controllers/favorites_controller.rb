class FavoritesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    favorite.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
