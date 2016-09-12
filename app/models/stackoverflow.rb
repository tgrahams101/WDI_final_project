# class Coursera
#   include HTTParty
#
#   base_uri 'https://api.coursera.org/api/catalog.v1/courses'
#   default_params fields: 'smallIcon,shortDescription,photoUrl', q: 'search'
#   format :json
#
#   def self.for term
#     get("", query: {query: term}) ["elements"]
#   end
# end
# class Coursera
#   include HTTParty
#
#   base_uri 'api.stackexchange.com'
#   default_params fields: 'smallIcon,shortDescription,photoUrl', q: 'search'
#   format :json
#
#   def self.for term
#     get("", query: {query: term}) ["elements"]
#   end
# end
#
# doing Coursera.for(something) will result in a direct array of result objects
#   get(https://api.coursera.org/api/catalog.v1/courses?fields=smallIcon,shortDescription,photoURL&q=search&query=history)
#
# youll be getting everything in the 'elements' key

# class Stackoverflow
#   include HTTParty
#   base_uri 'http://api.stackexchange'
#
#   def initialize(service, page)
#     @options = {query: {site: service, page: page}}
#   end
#
#   def questions
#     self.class.get("/2.2/questions", @options)
#   end
#
#   def users
#     self.class.get("/2.2/users", @options)
#   end
# end

# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users


# end


class Stackoverflow
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, page, term)
    @options = { query: {site: service, page: page, tagged: term} }
  end

  def questions(term)
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end
