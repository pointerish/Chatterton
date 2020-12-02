require_relative '../lib/joke'

describe Joke do
  let(:joke) { Joke.new }

  describe '#joke' do
    it 'returns a string' do
      expect(joke.joke).to be_a(String)
    end

    it 'does not return nil' do
      expect(joke.joke).not_to be_nil
    end
  end
end
