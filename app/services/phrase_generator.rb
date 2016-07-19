# The phrase generator takes an array of nouns
# as input and outputs a sentence string based on those words

class PhraseGenerator
  def initialize(words = '')
    @tagger = EngTagger.new
    tagged_words = @tagger.add_tags(words)
    @image_nouns = @tagger.get_nouns(tagged_words).keys
  end

  def perform
    @sentence = SENTENCES.sample(1)[0].split(' ')
    replace_nouns
    @sentence.join(' ')
  end

  private

  def array_without_punctuation
    @clean_array ||= @sentence.each_with_object([]) do |characters, array|
      array.push(characters.gsub(/[^A-Za-z ]/, ''))
    end
  end

  def replace_nouns
    tagged_sentence = @tagger.add_tags(@sentence.join(' '))
    @sentence_nouns = @tagger.get_nouns(tagged_sentence).keys
    @sentence_nouns.sample(word_limit).each_with_index do |word, index|
      @sentence = replace(@sentence, @image_nouns[index], word)
    end
  end

  def replace(array, word_in, word_out)
    index = array_without_punctuation.index(word_out)
    array[index] = word_in
    array
  end

  def word_limit
    sentence_noun_count = @sentence_nouns.count
    image_noun_count = @image_nouns.count
    sentence_noun_count > image_noun_count ?
      image_noun_count : sentence_noun_count
  end
end
