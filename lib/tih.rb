require 'json'
require 'httparty'

class Tih
  def initialize
    @data = JSON.parse(HTTParty.get('http://history.muffinlabs.com/date').to_s)
  end

  def random_event
    event = @data['data']['Events'].sample
    event['text']
  end
end
