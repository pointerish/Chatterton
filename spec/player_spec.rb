require 'httparty'
require_relative '../lib/player'
require 'dotenv'

Dotenv.load

describe Player do
  let(:player_test_data) do
    JSON.parse(HTTParty.get('https://public-api.tracker.gg/v2/apex/standard/profile/origin/Pointerish',
                            headers: { 'TRN-Api-Key' => ENV['APEX_API'] }).to_s)
  end
  let(:player) { Player.new(player_data: player_test_data) }

  describe '#level' do
    it 'returns a string' do
      expect(player.level).to be_a(String)
    end
    it 'does not return nil' do
      expect(player.level).not_to be_nil
    end
  end

  describe '#kills' do
    it 'returns a string' do
      expect(player.kills).to be_a(String)
    end
    it 'does not return nil' do
      expect(player.kills).not_to be_nil
    end
  end

  describe '#rank' do
    it 'returns a string' do
      expect(player.rank).to be_a(String)
    end
    it 'does not return nil' do
      expect(player.rank).not_to be_nil
    end
  end
end
