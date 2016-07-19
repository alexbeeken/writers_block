require 'rails_helper'

describe PhraseGenerator do
  describe '#perform' do
    it 'returns a phrase containing the inputted nouns' do
      input = ['beach', 'dog', 'ball', 'party', 'fish', 'whales']
      pg = PhraseGenerator.new(input.join(' '))

      output = pg.perform

      expect(output).to include (input[0])
      expect(output).to include (input[1])
      expect(output).to include (input[2])
      expect(output).to include (input[3])
    end
  end
end
