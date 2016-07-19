require 'rails_helper'

describe PhraseGenerator do
  describe '#perform' do
    it 'returns a phrase containing the inputted nouns' do
      input = ['beach', 'dog']
      pg = PhraseGenerator.new(input)

      output = pg.perform

      expect(output).to include (input[0])
      expect(output).to include (input[1])
    end
  end
end
