def duplicate_count(text)
    text.downcase.scan(/(\w)(?=.*\1)/).uniq.size
end

p duplicate_count('aBbcdeaa')
p duplicate_count('AAaa')
p duplicate_count('frank')
p duplicate_count('Elvis Frank Dominguez Vidal')

def dirReduc(arr)
    coor = [['NORTH','SOUTH'],['EAST', 'WEST']]

    begin
        exit = true
        coor.each do |cla,val|
            if arr.include?(cla) && arr.include?(val)
                exit = false
                arr.slice!(arr.index(cla))
                arr.delete_at(arr.index(val))
            end
        end
    end until exit
    return arr
end

def reduce2 arr
    (1...arr.length).each do |index|
        return reduce2(remove_oppositive(arr, index)) if (is_oppositive?(arr[(index - 1)..index]))
    end
    return arr
end

def is_oppositive?(coords)
    coords_opp = [['NORTH','SOUTH'],['EAST', 'WEST']]
    coords_opp.each{ |dir, opp| return true if (coords.include?(dir) && coords.include?(opp))}
    return false
end

def remove_oppositive(arr, index)
    arr.slice!(index)
    arr.slice!(index -1)
    return arr
end
p reduce2(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])
p reduce2(["NORTH", "WEST", "SOUTH", "EAST"])


def anagrams(word, words)
    words.select{|item| is_valid?(item, word)}
end

def is_valid?(item, word)
    item.chars.sort.join == word.chars.sort.join ? true : false
end

def testAnagrams(word, result, wrong)
    p  anagrams(word, result + wrong)
end

word0 = "a"
result0 = ["a"]
wrong0 = ["b", "c", "d"]
testAnagrams(word0, result0, wrong0)

word1 = "ab"
result1 = ["ab", "ba"]
wrong1 = ["aa", "bb", "cc", "ac", "bc", "cd"]
testAnagrams(word1, result1, wrong1)

word2 = "abba"
result2 = ["aabb", "bbaa", "abab", "baba", "baab"]
wrong2 = ["abcd", "abbba", "baaab", "abbab", "abbaa", "babaa"]
testAnagrams(word2, result2, wrong2)


p %W{
    1-kiwi
2-pear
3-kiwi
4-banana
5-melon
6-banana
7-melon
8-pineapple
9-apple
10-pineapple
11-cucumber
12-pineapple}

p [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]