require "word_count/version"

class WordCount
  def initialize(content)
    @content = content
  end

  def count
    without_non_alphabets.words.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  end

  def without_non_alphabets
    @content = @content.downcase.tr('^a-z0-9\'\s', ' ')
    self
  end

  def words
    @content.split(' ')
  end
end


