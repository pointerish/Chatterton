#!/usr/bin/env ruby

# rubocop:disable Layout/LineLength

require 'json'
require 'dotenv'
require 'httparty'
require 'discordrb'
require_relative '../lib/tih'
require_relative '../lib/joke'
require_relative '../lib/player'

Dotenv.load
bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_TOKEN'], prefix: '!'

def stats(player)
  headers_hash = { 'TRN-Api-Key' => ENV['APEX_API'] }
  JSON.parse(HTTParty.get("https://public-api.tracker.gg/v2/apex/standard/profile/origin/#{player}", headers: headers_hash).to_s)
end

bot.command :commands do
  "Available Commands:\n!stats: I take the platform (XBOX, PSN, Origin) and a Nickname for the player. Example: !stats origin Pointerish\n"\
  "!joke: Makes me tell you a joke!\n"\
  "!tih: Makes me tell you a random Today In History fact\n"\
  'I will also send you a joke through PM when you mention me!'
end

bot.command :joke do
  joke = Joke.new
  joke.joke
end

bot.command :tih do
  tih = Tih.new
  tih.random_event
end

bot.command(:stats, { platform: '', nickname: '' }) do |_event, nickname|
  player_stats = Player.new(player_data: stats(nickname))
  return "Player stats for #{nickname}:\nLevel: #{player_stats.level}\nKills: #{player_stats.kills}\nRank: #{player_stats.rank}"
end

bot.mention do |event|
  joke = Joke.new
  event.user.pm("You have summoned me. Prepare to die... of laughter:\n#{joke.joke}")
end

bot.run

# rubocop:enable Layout/LineLength
