def method
    puts 'methods'
end

method

def encrypt_this t
    t.gsub(/\b(\w)((\w)(\w*)(\w))?/){|t| "#{$1.ord}#{$5}#{$4}#{$3}" }
end

p encrypt_this "Hello   4   this is a my aloha to you"

########################################
class String
    def encrypt_this1
        chrs = self.chars
        [chrs.shift.ord, chrs.pop, chrs[1..-1], chrs.shift].join    
    end
end

def encrypt_this1(text)
    text.split.map(&:encrypt_this1).join(' ')
end

p encrypt_this1 "Hello   4   this is a my aloha to you"
#########################################
class String
    def encrypt_this2
        self.gsub(/\b(\w)((\w)(\w*)(\w))?/){|x| "#{$1.ord}#{$5}#{$4}#{$3}"}
        #self.gsub(/(\w)(\w)?(\w+?)?(\w)?\b/) { "#{$1.ord}#{$4}#{$3}#{$2}" }
    end
end

def encrypt_this2(text)
text.encrypt_this2
end

p encrypt_this2 "Hello   4   this is a my aloha to you"
