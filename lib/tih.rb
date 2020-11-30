require 'json'
require 'httparty'

class Tih
  # Tih means Today In History
  def initialize
    @data = JSON.parse(HTTParty.get('http://history.muffinlabs.com/date').to_s)
  end

  def random_event
    event = @data['data']['Events'].sample
    "Random Today in History: #{event['text']}"
  end
end
