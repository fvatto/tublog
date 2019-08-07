class TweetsController < ApplicationController
  before_action :redirect, except: :index

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(text: tweet_params[:text], url: tweet_params[:url], user_id: current_user.id)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :url)
  end

  def redirect
    redirect_to root_path unless user_signed_in?
  end
end
