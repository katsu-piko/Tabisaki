class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_tweets = @user.favorite_tweets
  end
end
