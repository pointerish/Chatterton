require_relative '../lib/joke'

RSpec::Matchers.define :be_boolean do
  match do |value|
    [true, false].include? value
  end
end

describe Joke do
  let(:joke) { Joke.new }
  describe '#nsfw?' do
    it 'returns boolean' do
      expect(joke.nsfw?).to be_boolean
    end
  end

  describe '#religious?' do
    it 'returns boolean' do
      expect(joke.religious?).to be_boolean
    end
  end

  describe '#political?' do
    it 'returns boolean' do
      expect(joke.political?).to be_boolean
    end
  end

  describe '#racist?' do
    it 'returns boolean' do
      expect(joke.racist?).to be_boolean
    end
  end

  describe '#sexist?' do
    it 'returns boolean' do
      expect(joke.sexist?).to be_boolean
    end
  end

  describe '#joke' do
    it 'returns a string' do
      expect(joke.joke).to be_a(String)
    end
  end
end

