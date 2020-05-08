class CaesarCipher
    def self.caesar_cipher string, shift
        string.chars.map do |letter|
            next letter unless !!(letter =~ /[A-Za-z]/i)
            (letter =~ /[a-z]/)? ((letter.ord-97+shift)%26 + 97).chr : ((letter.ord-65+shift)%26 + 65).chr
        end.join
    end
    
end

RSpec.describe CaesarCipher do
    it "test 1" do
        expect(CaesarCipher.caesar_cipher "What a string!", 5).to eq("Bmfy f xywnsl!")
    end
end