require 'json'
require 'httparty'

class Joke
  def initialize
    @endpoint = 'https://sv443.net/jokeapi/v2/joke/Programming?type=single'
    @joke = JSON.parse(HTTParty.get(@endpoint).to_s)
  end

  def joke
    @joke['joke']
  end

  def nsfw?
    @joke['flags']['nsfw']
  end

  def religious?
    @joke['flags']['religious']
  end

  def political?
    @joke['flags']['political']
  end

  def racist?
    @joke['flags']['racist']
  end

  def sexist?
    @joke['flags']['sexist']
  end
end

