module CodeKatas

  class Digit
    attr_accessor :top_left, :top_middle, :top_right, :middle_left, :middle_middle, :middle_right, :bottom_left, :bottom_middle, :bottom_right

    def as_array
      [:top_left, :top_middle, :top_right, :middle_left, :middle_middle, :middle_right, :bottom_left, :bottom_middle, :bottom_right]
    end

  end


  class UserStory1

    one = Digit.new()
    one.top_left = " "
    one.top_middle = " "
    one.top_right = " "
    one.middle_left = " "
    one.middle_middle = " "
    one.middle_right = " "
    one.bottom_left = " "
    one.bottom_middle = "|"
    one.bottom_right = "|"

    two = Digit.new()
    two.top_left = " "
    two.top_middle = "_"
    two.top_right = " "
    two.middle_left = " "
    two.middle_middle = "_"
    two.middle_right = "|"
    two.bottom_left = "|"
    two.bottom_middle = "_"
    two.bottom_right = " "

    three = Digit.new()
    three.top_left = " "
    three.top_middle = "_"
    three.top_right = " "
    three.middle_left = " "
    three.middle_middle = "_"
    three.middle_right = "|"
    three.bottom_left = " "
    three.bottom_middle = "_"
    three.bottom_right = "|"

    four = Digit.new()
    four.top_left = " "
    four.top_middle = " "
    four.top_right = " "
    four.middle_left = "|"
    four.middle_middle = "_"
    four.middle_right = "|"
    four.bottom_left = " "
    four.bottom_middle = " "
    four.bottom_right = "|"

    five = Digit.new()
    five.top_left = " "
    five.top_middle = "_"
    five.top_right = " "
    five.middle_left = "|"
    five.middle_middle = "_"
    five.middle_right = " "
    five.bottom_left = " "
    five.bottom_middle = "_"
    five.bottom_right = "|"

    six = Digit.new()
    six.top_left = " "
    six.top_middle = "_"
    six.top_right = " "
    six.middle_left = "|"
    six.middle_middle = "_"
    six.middle_right = " "
    six.bottom_left = "|"
    six.bottom_middle = "_"
    six.bottom_right = "|"

    seven = Digit.new()
    seven.top_left = " "
    seven.top_middle = "_"
    seven.top_right = " "
    seven.middle_left = " "
    seven.middle_middle = " "
    seven.middle_right = "|"
    seven.bottom_left = " "
    seven.bottom_middle = " "
    seven.bottom_right = "|"

    eight = Digit.new()
    eight.top_left = " "
    eight.top_middle = "_"
    eight.top_right = " "
    eight.middle_left = "|"
    eight.middle_middle = "_"
    eight.middle_right = "|"
    eight.bottom_left = "|"
    eight.bottom_middle = "_"
    eight.bottom_right = "|"

    nine = Digit.new()
    nine.top_left = " "
    nine.top_middle = "_"
    nine.top_right = " "
    nine.middle_left = "|"
    nine.middle_middle = "_"
    nine.middle_right = "|"
    nine.bottom_left = " "
    nine.bottom_middle = "_"
    nine.bottom_right = "|"

    zero = Digit.new()
    zero.top_left = " "
    zero.top_middle = "_"
    zero.top_right = " "
    zero.middle_left = "|"
    zero.middle_middle = " "
    zero.middle_right = "|"
    zero.bottom_left = "|"
    zero.bottom_middle = "_"
    zero.bottom_right = "|"

    DIGITS = [zero, one, two, three, four, five, six, seven, eight, nine]

    def initialize(contents)
      @file_contents = contents
    end
  end
end

