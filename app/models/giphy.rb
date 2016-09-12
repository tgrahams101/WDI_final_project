class Giphy
  include HTTParty
  # "https://api.coursera.org/api/courses.v1?q=search&query=malware+underground"

  base_uri 'http://api.giphy.com/v1/gifs/search'
  default_params api_key: 'dc6zaTOxFJmzC'
  format :json

  def self.for term
    get("", query: {q: term})
  end
end
