require './model/rail_fence_cipher_model.rb'

class RailFenceCipherEncryption < RailFenceCipherModel

  def perform
    return 'Parâmetros inválidos!' unless valid_text? && valid_key?

    current_array = 0

    key.times do
      splitted_text[counter] = []
      @counter += 1
    end

    save_space_indexes

    text.chars.each do |char|
      next if char.strip == ''

      current_array = 0 if current_array > key - 1
      splitted_text[current_array] << char
      current_array += 1
    end

    counter = 0

    key.times do
      splitted_text[counter].each do |char|
        complete_string << char
        complete_string << ' ' if space_indexes.include?(complete_string.length)
      end

      counter += 1
    end

    complete_string.join('').upcase
  end
end
