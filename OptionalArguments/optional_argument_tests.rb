module OptionalArguments
  class OptionalArgumentTests

    attr_accessor :test

    def initialize
      @test ||= "test"
    end

    def method_with_optional_arguments(a=10,b=20,c=30)
      puts a+b+c
    end

    def method_with_optional_arguments_using_hash(options = {})
      a = options[:a] || 0
      b = options[:b] || 0
      c = options[:c] || 0
      puts a + b + c
    end

    def to_s
      puts "#{object_id} and #{@test}"
    end
  end
end

x = OptionalArguments::OptionalArgumentTests.new

x.method_with_optional_arguments

x.method_with_optional_arguments(50,60,70)

x.method_with_optional_arguments_using_hash

x.method_with_optional_arguments_using_hash(:a => 10, :c => 60)

puts "The value is #{x.test}"

puts x.to_s