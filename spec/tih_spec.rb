require_relative '../lib/tih'

describe Tih do
  let(:tih) { Tih.new }

  describe '#random_event' do
    it 'returns a string' do
      expect(tih.random_event).to be_a(String)
    end
    it 'does not return nil' do
      expect(tih.random_event).not_to be_nil
    end
  end
end
