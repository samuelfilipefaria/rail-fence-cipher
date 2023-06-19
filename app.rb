require './rail_fence_cipher_encryption'
require './rail_fence_cipher_decryption'

class App
  attr_accessor :option, :text, :key

  def initialize
    @option = 0
    @text = ''
    @key = 0
  end

  def perform
    show_options

    option = gets.chomp.to_i

    case option
    when 1
      get_inputs(option)
      puts "Texto encriptado: #{RailFenceCipherEncryption.new(text, key).perform}"

    when 2
      get_inputs(option)
      puts "Texto desencriptado: #{RailFenceCipherDecryption.new(text, key).perform}"

    when 3
      get_inputs(option)
      decrypt_without_key(text)
    else
      puts 'Opção inválida!'
    end
  end

  def show_options
    puts "\n-------------------OPÇÕES-------------------\n"
    puts '
      1 - Encriptar
      2 - Desencriptar com chave
      3 - Desencriptar sem chave
    '
    puts 'Escolha uma opção:'
  end

  def get_inputs(operation_type)
    puts 'Informe o texto:'
    @text = gets.chomp

    return if operation_type == 3

    puts 'Informe a chave:'
    @key = gets.chomp.to_i
  end

  def decrypt_without_key(text)
    i = 2

    text.length.times do
      puts "Tentativa de texto desencriptado (chave: #{i}) -> #{RailFenceCipherDecryption.new(text, i).perform}"

      i += 1
    end
  end
end

App.new.perform
