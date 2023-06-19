require './model/rail_fence_cipher_model.rb'

class RailFenceCipherDecryption < RailFenceCipherModel

  def perform
    return 'Parâmetros inválidos!' unless valid_text? && valid_key?

    current_index = 0

    key.times do
      splitted_text[counter] = []
      @counter += 1
    end

    save_space_indexes

    text_without_spaces = text.gsub(' ', '')

    counter = 0

    key.times do
      splitted_text[counter] = if counter.zero? && (text_without_spaces.length % key != 0)
                                 text_without_spaces[0..(text_without_spaces.length / key)]
                               elsif counter.zero? && !(text_without_spaces.length % key != 0)
                                 text_without_spaces[0..(text_without_spaces.length / key) - 1]
                               elsif !counter.zero? && (text_without_spaces.length % key != 0)
                                 text_without_spaces[current_index..(text_without_spaces.length / key) + current_index]
                               elsif !counter.zero? && !(text_without_spaces.length % key != 0)
                                 text_without_spaces[current_index..(text_without_spaces.length / key) + current_index - 1]
                               end

      current_index += splitted_text[counter].length
      counter += 1
    end

    if splitted_text[-2].length - splitted_text[-1].length == 2
      splitted_text[-1] = splitted_text[-2][-1] + splitted_text[-1]
      splitted_text[-2] = splitted_text[-2][0..-2]
    end

    counter = 0

    biggest_array_length(splitted_text).times do
      splitted_text.each do |array|
        complete_string << array[counter]
        complete_string << ' ' if space_indexes.include?(complete_string.length)
      end

      counter += 1
    end

    complete_string.compact.join('').downcase
  end

  def biggest_array_length(array_collection)
    biggest_array_length = array_collection[0].length

    array_collection.each do |array|
      biggest_array_length = array.length if array.length > biggest_array_length
    end

    biggest_array_length
  end
end
