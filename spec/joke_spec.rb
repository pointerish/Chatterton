require_relative '../lib/joke'

describe Joke do
  let(:joke) { Joke.new }

  describe '#joke' do
    it 'returns a string' do
      expect(joke.joke).to be_a(String)
    end
  end
end
