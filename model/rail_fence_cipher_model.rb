class RailFenceCipherModel
  attr_accessor :text, :key, :space_indexes, :splitted_text, :counter, :complete_string

  def initialize(text, key)
    @text = text
    @key = key
    @space_indexes = []
    @splitted_text = []
    @counter = 0
    @complete_string = []
  end

  def valid_text?
    return true if text.strip != ''

    false
  end

  def valid_key?
    return true if key.positive? && key <= text.length

    false
  end

  def save_space_indexes
    text.chars.each_with_index do |char, i|
      space_indexes << i if char.strip == ''
    end
  end
end
