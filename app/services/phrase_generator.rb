# The phrase generator takes an array of nouns
# as input and outputs a sentence string based on those words

class PhraseGenerator
  def initialize(nouns)
    @nouns = nouns
  end

  def perform
    @sentence_words = SENTENCES.sample(1)[0].split(' ')
    replace_words
  end

  private

  def replace_words
    words_to_replace.each_with_index do |word, count|
      index = @sentence_words.index(word)
      @sentence_words[index] = @nouns[count]
    end
    @sentence_words
  end

  def words_to_replace
    # planning ahead here because this will be useful when using the API
    @sentence_words.sample(@nouns.count)
  end
end
