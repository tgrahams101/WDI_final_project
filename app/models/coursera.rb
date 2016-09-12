class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: 'smallIcon,shortDescription,photoUrl', q: 'search'
  # format :json

  def self.for term
    get("", query: {query: term}) 
  end
end

# pp Coursera.for "python"
