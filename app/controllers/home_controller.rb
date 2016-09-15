require 'httparty'


class HomeController < ApplicationController
  skip_before_action :authorize







  def index


  end



  def giphy

    @gifs = Giphy.for('Dallas Cowboys')['data']

  end
  def vine

    # Note that the parameters below for the vine username and passwords should be replaced with your own credentials. For some reason, using environment variables didn't work for me, so I ended up having to hardcode my credentials.
    # vine = API.new(ENV['VINE_USERNAME]', ENV['VINE_PASSWORD']) #should be uncommented in production with your own credentials in place
    @vines = vine.tagged('dallascowboys')

  end



  def tweet

    # The commented out code is another way to pull tweets that just gives you the json for the tweet. For my production app, I opted for a different method that involves just using Twitter's embedded timelines feature.
    # client = Twitter::REST::Client.new do |config|
    # config.consumer_key        = ENV['TWITTER_KEY']
    # config.consumer_secret     = ENV['TWITTER_SECRET']
    # config.access_token        = ENV['TWITTER_TOKEN']
    # config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
  # end





  end

  # Both the periscope and tweet feeds use the same Twitter embedded timeline code from its API. The only difference is that when you go to set up your timeline on the dev website you add an 'filter:periscope at the end of your search query'

  def periscope

  render 'embedded_periscope'

  end

  def tweet

  render 'embedded_twitter'

  end
end
