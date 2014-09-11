class SearchesController < ApplicationController
  def create
    redirect_to search_path(params[:twitter][:search])
  end

  def show
    @tweets = Twitter::REST::Client.
      new(TWITTER_CONFIG).
      search("##{params[:id]}").
      take(15)
  end
end
