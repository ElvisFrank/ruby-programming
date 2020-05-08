#       Notes of test with rspec
# https://www.tutorialspoint.com/rspec/rspec_basic_syntax.htm
# http://rspec.info
# RSpec - Introduction
class HelloWorld
    def say_hello
       "Hello World!"
    end
 end
# RSpec - Basic Syntax
describe HelloWorld do
 #-Used to define an “Example Group”.
 # You can think of an “Example Group” as a collection of tests.
    context "When testing the HelloWorld class" do 
    #-Similar to describe, is no mandatory, but it helps to add
    # more details about the examples that it contains.       
        it "The say_hello method should return 'Hello World'" do 
        #-Used to define an "Example". An example is basically a test or a test case.
            hw = HelloWorld.new 
            message = hw.say_hello
            expect(message).to eq "Hello World!"      # When you want the Expectation to be true
            expect(message).not_to eq "Hola Mundo!"   # When you want the Expectation to be false
            #-Use to define an "Expectation" in RSpec. This is a verification step
            # where we check, that a specific expexted condition has been met.
       end
    end
end
# RSpec - Writing Specs
class StringAnalizer
    def has_vowels? str
        !!(str =~ /[aeiou]+/i)
    end
end
RSpec.describe StringAnalizer do
    context "Whit valid input" do
        it "Should detect when a string contains vowels" do
            sa = StringAnalizer.new
            test_string = 'uuu'
            expect(sa.has_vowels? test_string).to be true
        end
    end
end

# RSpec - Matchers
describe "An example of the equality Matchers" do 
    it "should show how the equality Matchers work" do 
       a = "test string" 
       b = a 
       # The following Expectations will all pass 
       expect(a).to eq "test string"    # Passes when actual == expected
       expect(a).to eql "test string"   # Passes when actual.eql?(expected)
       expect(a).to be b                # Passes when actual.equal?(expected)
       expect(a).to equal b             # Also passes when actual.equal?(expected)
 # describe "An example of the comparison Matchers" do
    # it "should show how the comparison Matchers work" do
       a = 1
       b = 2
       c = 3		
       d = 'test string'    # Passes when..
       expect(b).to be > a      # actual > expected
       expect(a).to be >= a     # actual >= expected
       expect(a).to be < b      # actual < expected
       expect(b).to be <= b     # actual <= expected
       expect(c).to be_between(1,3).inclusive    # actual is <= and >= max
       expect(b).to be_between(1,3).exclusive    # actual is < min and > max
       expect(d).to match /TEST/i                # actual matches a regular expression
 # describe "An example of the type/class Matchers" do
    # it "should show how the type/class Matchers work" do
       x= 1
       y = 3.14
       z = 'test string'    # Passes when actual..
       expect(x).to be_instance_of  Fixnum  # is an instance of the expected class.
       expect(y).to be_kind_of Numeric      # is am instance of the expected class or any of its parents classes.
       expect(z).to respond_to(:length)     # responds to the specified method.
 # describe "An example of the true/false/nil Matchers" do
    # it "should show how the true/false/nil Matchers work" do
        x = true 
        y = false 
        z = nil 
        a = "test string"   # Passes when actual..
        expect(x).to be true    # == true
        expect(y).to be false   # == false
        expect(a).to be_truthy  # is not false or nil
        expect(z).to be_falsey  # is false or nil
        expect(z).to be_nil     # is nil
 # describe "An example of the error Matchers" do 
    # it "should show how the error Matchers work" do
        # expect {block}.to ..  # Passes when the block raises an error..
        expect { 1/0 }.to raise_error(ZeroDivisionError)    # of type ErrorClass
        expect { 1/0 }.to raise_error("divided by 0")       # with the message "error message"
        expect { 1/0 }.to raise_error("divided by 0", ZeroDivisionError)    # of type ErrorClass with the message "error message"
    end  
 end
# RSpec - Test Doubles
 # Test doubles allows you test your code even when it relies on a class that
 # is undefined or unavailable.
 # Also, this means that when there is a test failure, you can tell right away
 # that it's because of an issue in your class and not a other class.
class ClassRoom 
    def initialize(students) 
       @students = students 
    end
    
    def list_student_names 
       @students.map(&:name).join(',') 
    end 
end
 
 describe ClassRoom do 
    it 'the list_student_names method should work correctly' do 
       student1 = double('student') 
       student2 = double('student') 
# RSpec - Stubs
       allow(student1).to receive(:name) { 'John Smith'} 
       allow(student2).to receive(:name) { 'Jill Smith'} 
       # forma antigua:
       # student1.stub(:name).and_return('John Smith')
       cr = ClassRoom.new [student1,student2]
       expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
    end 
 end

# RSpec - Hooks
class SimpleClass 
    attr_accessor :message  
    def initialize() 
       puts "\nCreating a new instance of the SimpleClass class" 
       @message = 'howdy' 
    end 
    
    def update_message(new_message) 
       @message = new_message 
    end 
end 
 # before - Initalize an instance of class to each test
describe SimpleClass do 
    before(:each) do        # To create a SimpleClass instance for each test
       @simple_class = SimpleClass.new 
    end 
    
    it 'should have an initial message' do 
       expect(@simple_class).to_not be_nil
       @simple_class.message = 'Something else. . .'    # not necesary change
    end 
    
    it 'should be able to change its message' do
       @simple_class.update_message('a new message')
       expect(@simple_class.message).to_not be 'howdy'  # ===
    end
end
 # Other examples by before/alfer
describe "Before and after hooks" do 
    before(:each) do 
       puts "Runs before each Example" 
    end 
    
    after(:each) do 
       puts "Runs after each Example" 
    end 
    
    before(:all) do 
       puts "Runs before all Examples" 
    end 
    
    after(:all) do 
       puts "Runs after all Examples"
    end 
    
    it 'is the first Example in this spec file' do      # Runs before all Examples
       puts 'Running the first Example'                 # Runs before each Example
    end                                                 # Running the first Example
                                                        # Runs after each Example
    it 'is the second Example in this spec file' do     # .Runs before each Example
       puts 'Running the second Example'                # Running the second Example
    end                                                 # Runs after each Example
 end                                                    # .Runs after all Examples

 # RSpec - Tags | Test with time of sleep
 describe "How to run specific Examples with Tags" do 
    it 'is a fast test', :fast => true do 
       puts 'This test is fast!' 
    end
    
    it 'is a slow test', :slow => true do 
       sleep 6                  # Sleep for 6seconds
       puts 'This test is slow!' 
    end
 end

# RSpec - Subjects
class Person 
    attr_reader :first_name, :last_name 
    
    def initialize(first_name, last_name) 
       @first_name = first_name 
       @last_name = last_name 
    end 
end
 # a little test
describe Person do
    it 'create a new person with a first and last name' do
       person = Person.new 'John', 'Smith'
       
       expect(person).to have_attributes(first_name: 'John') 
       expect(person).to have_attributes(last_name: 'Smith') 
    end 
end
 # other way more clean:
describe Person.new 'John', 'Smith' do 
    it { is_expected.to have_attributes(first_name: 'John') } 
    it { is_expected.to have_attributes(last_name: 'Smith') }
end

# RSpec - Helperes
class Dog 
    attr_reader :good_dog, :has_been_walked 
    
    def initialize(good_or_not) 
       @good_dog = good_or_not 
       @has_been_walked = false 
    end 
    
    def walk_dog 
       @has_been_walked = true 
    end 
end 
 
describe Dog do 
    it 'should be able to create and walk a good dog' do 
       dog = Dog.new(true) 
       dog.walk_dog 
       
       expect(dog.good_dog).to be true
       expect(dog.has_been_walked).to be true 
    end 
    
    it 'should be able to create and walk a bad dog' do 
       dog = Dog.new(false) 
       dog.walk_dog 
 
       expect(dog.good_dog).to be false
       expect(dog.has_been_walked).to be true 
  
    end 
end
 # This code is clear, but it's always a good idea to reduce repeated code whenever possible.
describe Dog do 
    def create_and_walk_dog(good_or_bad)
       dog = Dog.new(good_or_bad)
       dog.walk_dog
       return dog 
    end 
    
    it 'should be able to create and walk a good dog' do
       dog = create_and_walk_dog(true)
       
       expect(dog.good_dog).to be true
       expect(dog.has_been_walked).to be true 
    end 
    
    it 'should be able to create and walk a bad dog' do 
       dog = create_and_walk_dog(false)
       
       expect(dog.good_dog).to be false
       expect(dog.has_been_walked).to be true 
    end 
end

# RSpec - Metadata
RSpec.describe "An Example Group with a metadata variable", :foo => 17 do 
    context 'and a context with another variable', :bar => 12 do 
       
       it 'can access the metadata variable of the outer Example Group' do |example| 
          expect(example.metadata[:foo]).to eq(17) 
       end
       
       it 'can access the metadata variable in the context block' do |example|  
          expect(example.metadata[:bar]).to eq(12) 
       end 
       
    end 
end
RSpec.describe "An Example Group with a metadata variable", :foo => 17 do
    context 'and a context with another variable', :bar => 12 do 
       
       it 'can access the metadata variable in the context block' do |example|
            expect(example.metadata[:foo]).to eq(17) 
            expect(example.metadata[:bar]).to eq(12) 
            example.metadata.each do |k,v|
                puts "#{k}: #{v}"
            end
        end
    end 
end

# RSpec - Filtering
RSpec.describe "An Example Group with positive and negative Examples" do 
    context 'when testing Ruby\'s build-in math library' do
       
       it 'can do normal numeric operations' do 
          expect(1 + 1).to eq(2) 
       end 
       
       it 'generates an error when expected' do
          expect{1/0}.to raise_error(ZeroDivisionError) 
       end       
    end 
end
 # For negativeor positive expected.
 # Run only positive test: rspec --tag positive filter_spec.rb
RSpec.describe "An Example Group with positive and negative Examples" do 
    context 'when testing Ruby\'s build-in math library' do
       
       it 'can do normal numeric operations', positive: true do 
          expect(1 + 1).to eq(2) 
       end 
       
       it 'generates an error when expected', negative: true do 
          expect{1/0}.to raise_error(ZeroDivisionError) 
       end
       
    end 
end
# RSpec - Formatters
 # Run: rspec --format progress formatter_spec.rb
 # Run: rspec --format doc formatter_spec.rb
RSpec.describe "A spec file to demonstrate how RSpec Formatters work" do 
    context 'when running some tests' do 
       
       it 'the test usually calls the expect() method at least once' do 
          expect(1 + 1).to eq(2) 
       end   
    end 
end

# RSpec - Expectations | old syntax
RSpec.describe "An RSpec file that uses the old syntax" do
    it 'you should see a warning when you run this Example' do 
       (1 + 1).should eq(2) 
    end 
 end