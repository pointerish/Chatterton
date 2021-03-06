require 'json'
require 'httparty'

class Joke
  def initialize
    @endpoint = 'https://sv443.net/jokeapi/v2/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist&type=single'
    @response = HTTParty.get(@endpoint)
  end

  def joke
    case @response.code
    when 200
      JSON.parse(@response.to_s)['joke']
    else
      'Oops! The jokes are down right now. What a joke!'
    end
  end
end
