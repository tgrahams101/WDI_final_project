module ApplicationHelper

  def gucci
        @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = ENV['TWITTER_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
  end


  class API
    include HTTParty
    # "https://api.coursera.org/api/courses.v1?q=search&query=malware+underground"

    base_uri 'https://api.vineapp.com'

    def initialize(username, password)
      login(username, password)
    end

    def tagged(tag, query = {})
          query = {
            page: 1,
            size: 20
          }.merge!(query)

          Collection.new(get_parsed("/timelines/tags/#{tag}", query)["records"].map { |r| Record.new(r) })
    end

    private

    def login(username, password)
          response = self.class.post("/users/authenticate", {
            body: {
              username: username,
              password: password
            }
          })

          body = parse_json(response.body)

          @auth = {
            user_id: body["data"]["userId"],
            key: body["data"]["key"]
          }
    end

    def get(url, query = {}, headers = {})
        headers.merge!({
          "User-Agent" => "com.vine.iphone/1.0.3 (unknown, iPhone OS 6.0.1, iPhone, Scale/2.000000)",
          "Accept-Language" => "en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8",
          "vine-session-id" => @auth[:key]
        })

        self.class.get(url, { query: query, headers: headers })
    end

      # Private: perfoms the get method and parses the response.
      #
      # Returns a Hash of the HTTP GET response body.
    def get_parsed(*get_args)
        response = send(:get, *get_args)
        parse_json(response.body)["data"]
    end


    def parse_json(string)
       JSON.parse(string)
    end
  end

  class Collection < Set

    def add(record)
      raise TypeError, "the object is not a Record" unless record.is_a? Record
      super(record)
    end
    alias_method :<<, :add
  end


  class Record
    attr_reader :description, :id, :raw, :share_url, :thumbnail_url, :user_id, :venue, :video_url

    def initialize(data)
      @description = data["description"]
      @id = data["postId"]
      @raw = data
      @share_url = data["shareUrl"]
      @thumbnail_url = data["thumbnailUrl"]
      @user_id = data["userId"]
      @venue = data["venue_name"]
      @video_url = data["videoUrl"]
    end

    def inspect
      "<#{self.class} @id=\"#{@id}\" @video_url=\"#{@video_url}\" @description=\"#{@description}\">"
    end

    def embed_tag(type = :simple)
      allowed_types = [:simple, :postcard]
      type = :simple unless allowed_types.include?(type)


    "<iframe src=\"#{@share_url}/embed/#{type}\" width=\"400\" height=\"600\"></iframe>"
    end
  end

end
