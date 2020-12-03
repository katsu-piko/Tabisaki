class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name] == 'hokkaido'
      @tweets = Tweet.where(area_id: 2)
    elsif params[:name] == 'tohoku'
      @tweets = Tweet.where(area_id: 3..8)
    elsif params[:name] == 'kanto'
      @tweets = Tweet.where(area_id: 9..15)
    elsif params[:name] == 'toukai_hokuriku'
      @tweets = Tweet.where(area_id: 16..25)
    elsif params[:name] == 'kinki'
      @tweets = Tweet.where(area_id: 26..31)
    elsif params[:name] == 'tyugoku_shikoku'
      @tweets = Tweet.where(area_id: 32..40)
    elsif params[:name] == 'kyusyu'
      @tweets = Tweet.where(area_id: 41..47)
    elsif params[:name] == 'okinawa'
      @tweets = Tweet.where(area_id: 48)
    else params[:name] == 'kaigai'
         @tweets = Tweet.where(area_id: 49)
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @tweet.user_id
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :spot, :comment, :advice, :area_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
