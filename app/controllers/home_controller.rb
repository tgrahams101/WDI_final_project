require 'httparty'
require 'redvine'

class HomeController < ApplicationController
  skip_before_action :authorize







  def index

    # response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

    # puts response.body, response.code, response.message, response.headers.inspect

    # client = Redvine.new
    # client.connect(email: ENV["VINE_USERNAME"], password: ENV["VINE_PASSWORD"])
    # @cowboys = client.search('dallascowboys')
    # render plain: @cowboys
  end

  def yoga
    @overflow = Stackoverflow.new("www.stackoverflow.com", 1, 'httparty')
    @overflow = @overflow.questions('httparty')['items']
    # render plain: @overflow.questions.body
    # puts @overflow.questions

    # response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    # render plain: response.body
  end

  def giphy

    @gifs = Giphy.for('Dallas Cowboys')['data']
    # render plain: @gifs
  end
  def vine
    # client = Redvine.new
    # render plain: client

    vine = API.new("tanyansi@gmail.com", "vine3499")
    @vines = vine.tagged('dallascowboys')
    # render plain: cowboyvines.inspect
  end



  def tweet
    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_KEY']
    config.consumer_secret     = ENV['TWITTER_SECRET']
    config.access_token        = ENV['TWITTER_TOKEN']
    config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
  end



    client.update("I'm tweeting with @gem!")
    redirect_to '/vine'
  end

  def get_tweets
    gucci

  # @stuff = @client.search("to:dallascowboys", result_type: "recent").take(3)
  # @stuff = @client.search("to:dallascowboys", result_type: "recent").take(3).collect do |tweet|
  # "#{tweet.user.screen_name}: #{tweet.text}"
  @stuff = @client.search("to:dallascowboys", result_type: "recent").take(3).collect do |tweet|
    tweet.to_h.to_json

  # @periscope = @client.search("\"dallascowboys\" filter:periscope", result_type: "recent").take(3).collect do |tweet|
  #   tweet.to_h.to_json
  end
  render 'embedded_twitter'
  #
  #
  # render plain: @stuff.first

  end
end
