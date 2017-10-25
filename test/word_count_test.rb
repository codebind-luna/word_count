require "test_helper"

class WordCountTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WordCount::VERSION
  end

  def test_count_one_word
    phrase = WordCount.new("word")
    counts = { "word" => 1 }
    assert_equal counts, phrase.count
  end

  def test_count_one_of_each_word
  	phrase = WordCount.new("one of each")
    counts = {"one" => 1, "of" => 1, "each" => 1}
    assert_equal counts, phrase.count
  end

  def test_multiple_occurrences_of_a_word
    phrase = WordCount.new("one fish two fish red fish blue fish")
    counts = {"one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1}
    assert_equal counts, phrase.count
  end

  def test_handles_cramped_lists
    phrase = WordCount.new("one,two,three")
    counts = {"one" => 1, "two" => 1, "three" => 1}
    assert_equal counts, phrase.count
  end

  def test_handles_expanded_lists
    phrase = WordCount.new("one,\ntwo,\nthree")
    counts = {"one" => 1, "two" => 1, "three" => 1}
    assert_equal counts, phrase.count
  end

  def test_ignore_punctuation
    phrase = WordCount.new("car: carpet as java: javascript!!&@$%^&")
    counts = {"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
    assert_equal counts, phrase.count
  end

  def test_include_numbers
    phrase = WordCount.new("testing, 1, 2 testing")
    counts = { "testing" => 2, "1" => 1, "2" => 1 }
    assert_equal counts, phrase.count
  end

  def test_normalize_case
    phrase = WordCount.new("go Go GO Stop stop")
    counts = { "go" => 3, "stop" => 2 }
    assert_equal counts, phrase.count
  end

  def test_with_apostrophes
    phrase = WordCount.new("First: don't laugh. Then: don't cry.")
    counts = { "first" => 1, "don't" => 2, "laugh" => 1, "then" => 1, "cry" => 1 }
    assert_equal counts, phrase.count
  end
end
