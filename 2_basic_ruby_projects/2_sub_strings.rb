def substrings words, dictionary
    words.chars.each_with_index.reduce(Hash.new(0)) do |acumulator, data|
        letter,index = data
        next acumulator unless letter =~ /[A-Za-z]/
        dictionary.each do |word|
            index_end = index + word.length - 1
            acumulator[word] += 1 if !!(words[index..index_end] =~ /#{word}/i)
        end
        acumulator
    end
end
   
RSpec.describe "Testo to substring method" do
    before(:all) do
        @dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    end

    context " with only word" do
        it "the word is: below" do
            words = "below"
            result = { "below" => 1, "low" => 1 }
            expect(substrings words, @dictionary).to eq result 
        end
    end

    context " with many words" do
        it "the words are: Howdy partner, sit down! How's it going?" do
            words = "Howdy partner, sit down! How's it going?"
            result = { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
            expect(substrings words, @dictionary).to eq result 
        end
    end
end