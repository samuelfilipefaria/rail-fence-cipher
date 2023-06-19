require_relative '../rail_fence_cipher_decryption.rb'

describe RailFenceCipherDecryption do
  tested_object = RailFenceCipherDecryption

  describe 'when the text and the key are valid' do
    it 'decrypt the text' do
      expect(tested_object.new('ACB', 2).perform).to eql('abc')
    end
  end

  describe 'when the text and the key are valid but the text has spaces' do
    it 'decrypt the text and keep the spaces' do
      expect(tested_object.new('TDDA LFZ UOE PEG AOOI EAATDS MRIUL', 2).perform).to eql('todo dia ela faz tudo sempre igual')
    end
  end

  describe 'when the text is an empty string' do
    it 'return an error' do
      expect(tested_object.new('    ', 2).perform).to eql('Parâmetros inválidos!')
    end
  end

  describe 'when the key is 0' do
    it 'return an error' do
      expect(tested_object.new('abc', 0).perform).to eql('Parâmetros inválidos!')
    end
  end

  describe 'when the key is negative' do
    it 'return an error' do
      expect(tested_object.new('abc', -1).perform).to eql('Parâmetros inválidos!')
    end
  end

  describe 'when the key is bigger than the text length' do
    it 'return an error' do
      expect(tested_object.new('abc', 4).perform).to eql('Parâmetros inválidos!')
    end
  end
end
