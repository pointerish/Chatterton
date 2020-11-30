# rubocop:disable Style/RedundantBegin
# rubocop:disable Style/RescueStandardError

class Player
  def initialize(player_data:)
    @player_data = player_data
  end

  def level
    begin
      @player_data['data']['segments'][0]['stats']['level']['displayValue']
    rescue
      'Darn it! It looks like the API is down right now.'
    end
  end

  def kills
    begin
      @player_data['data']['segments'][0]['stats']['kills']['displayValue']
    rescue
      'Darn it! It looks like the API is down right now.'
    end
  end

  def rank
    begin
      @player_data['data']['segments'][0]['stats']['rankScore']['metadata']['rankName']
    rescue
      'Darn it! It looks like the API is down right now.'
    end
  end
end

# rubocop:enable Style/RedundantBegin
# rubocop:enable Style/RescueStandardError
