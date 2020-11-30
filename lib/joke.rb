require 'json'
require 'httparty'

class Joke
  def initialize
    @endpoint = 'https://sv443.net/jokeapi/v2/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist&type=single'
    @joke = JSON.parse(HTTParty.get(@endpoint).to_s)
  end

  def joke
    @joke['joke']
  end
end
