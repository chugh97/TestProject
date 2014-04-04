module CodeKatas

  class Digit
    attr_accessor :top_left, :top_middle, :top_right, :middle_left, :middle_middle, :middle_right, :bottom_left, :bottom_middle, :bottom_right

    attr_accessor :digit_identifier, :other_possibilities

    def as_array
      [:top_left, :top_middle, :top_right, :middle_left, :middle_middle, :middle_right, :bottom_left, :bottom_middle, :bottom_right]
    end
  end

  class Output
    attr_accessor :account_number, :possible_matches
    def initialize
      @possible_matches =[]
    end
  end

  class UserStory1
    one = Digit.new()
    one.digit_identifier = 1
    one.top_left = " "
    one.top_middle = " "
    one.top_right = " "
    one.middle_left = " "
    one.middle_middle = " "
    one.middle_right = "|"
    one.bottom_left = " "
    one.bottom_middle = " "
    one.bottom_right = "|"
    one.other_possibilities = [7]

    two = Digit.new()
    two.digit_identifier = 2
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
    three.digit_identifier = 3
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
    four.digit_identifier = 4
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
    five.digit_identifier = 5
    five.top_left = " "
    five.top_middle = "_"
    five.top_right = " "
    five.middle_left = "|"
    five.middle_middle = "_"
    five.middle_right = " "
    five.bottom_left = " "
    five.bottom_middle = "_"
    five.bottom_right = "|"
    five.other_possibilities = [9,6]

    six = Digit.new()
    six.digit_identifier = 6
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
    seven.digit_identifier = 7
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
    eight.digit_identifier = 8
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
    nine.digit_identifier = 9
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
    zero.digit_identifier = 0
    zero.top_left = " "
    zero.top_middle = "_"
    zero.top_right = " "
    zero.middle_left = "|"
    zero.middle_middle = " "
    zero.middle_right = "|"
    zero.bottom_left = "|"
    zero.bottom_middle = "_"
    zero.bottom_right = "|"
    zero.other_possibilities = [8]

    DIGITS = [one, two, three, four, five, six, seven, eight, nine, zero]

    attr_accessor :output_accounts

    def initialize(file_path)
      @file_path = file_path
      @contents = []
      @output_accounts = []
    end

    def read_file_and_list_account_numbers
      f = File.open(@file_path, "r")
      f.each_line do |line|
        line.chomp!()
        while (line.length <= 27)
          line << " "
        end
        @contents << line[0..27]
      end
      f.close

      @bank_account_numbers = @contents.each_slice(3).to_a

      split_array_in_groups
    end

    private

    def split_array_in_groups
      @bank_account_numbers.each do |bank_account|
        output = []
        @grouped_array = []
        bank_account.each do |line_as_array|
          @grouped_array << line_as_array.scan(/./).each_slice(3).to_a
        end
        outputReport = CodeKatas::Output.new

        digits_to_identify_groups = convert_array_in_groups_of_numbers

        digits_to_identify_groups.each do |group|
          parsed_value_array = compare_unidentified_digit_and_try_recognise(parse_digit(group))

          if parsed_value_array
            output << parsed_value_array.digit_identifier
          else
            possible_numbers = try_a_possibility(parse_digit(group))
            possible_numbers.each do |possible_number|
              temp_output = Array.new(output)
              temp_output << possible_number
              outputReport.possible_matches << temp_output
            end
            output << "?"
          end
        end


        outputReport.account_number = output.join("")

        @output_accounts << outputReport
        #puts "The account number is #{output.join("")}"
      end
    end

    def try_a_possibility(parse_digit)
      probable_numbers = []
      DIGITS.each do |digit|
        match_count = 0
        #puts "trying to match #{digit.digit_identifier}"
        if digit.top_left == parse_digit.top_left
          match_count += 1
        end

        if digit.top_middle == parse_digit.top_middle
          match_count += 1
        end

        if digit.top_right == parse_digit.top_right
          match_count += 1
        end

        if digit.middle_left == parse_digit.middle_left
          match_count += 1
        end

        if digit.middle_middle == parse_digit.middle_middle
          match_count += 1
        end
        if digit.middle_right == parse_digit.middle_right
          match_count += 1
        end

        if digit.bottom_left == parse_digit.bottom_left
          match_count += 1
        end

        if digit.bottom_middle == parse_digit.bottom_middle
          match_count += 1
        end

        if digit.bottom_right == parse_digit.bottom_right
          match_count += 1
        end

        if match_count >=8
          probable_numbers << digit.digit_identifier
        end
        #puts "The match count is #{match_count} for #{digit.digit_identifier}"
      end
      probable_numbers
    end

    def convert_array_in_groups_of_numbers
      groups = []
      (0..8).each do |i|
        groups << [@grouped_array[0][i],@grouped_array[1][i], @grouped_array[2][i]]
      end
      groups
    end

    def parse_digit(group)
      top_line = group[0]
      middle_line = group[1]
      bottom_line = group[2]

      unidentified_digit = Digit.new

      unidentified_digit.top_left = top_line[0]
      unidentified_digit.top_middle = top_line[1]
      unidentified_digit.top_right = top_line[2]

      unidentified_digit.middle_left  = middle_line[0]
      unidentified_digit.middle_middle  = middle_line[1]
      unidentified_digit.middle_right = middle_line[2]

      unidentified_digit.bottom_left  = bottom_line[0]
      unidentified_digit.bottom_middle  = bottom_line[1]
      unidentified_digit.bottom_right = bottom_line[2]

      unidentified_digit
    end

    def compare_unidentified_digit_and_try_recognise(parse_digit)
      DIGITS.each do |digit|
        #puts "trying to match #{digit.digit_identifier}"
        if digit.top_left == parse_digit.top_left && digit.top_middle == parse_digit.top_middle && digit.top_right == parse_digit.top_right &&
           digit.middle_left == parse_digit.middle_left && digit.middle_middle == parse_digit.middle_middle && digit.middle_right == parse_digit.middle_right &&
           digit.bottom_left == parse_digit.bottom_left && digit.bottom_middle == parse_digit.bottom_middle && digit.bottom_right == parse_digit.bottom_right
           return digit
        end
      end
      nil
    end

  end
end


x = CodeKatas::UserStory1.new("./bank_accounts_4.txt")
x.read_file_and_list_account_numbers

x.output_accounts.each do |account|
  str = "Account Number #{account.account_number}"
  if account.possible_matches
    account_list = ""
    account.possible_matches.each do |possible_match|
      account_list += possible_match.join("") + ","
    end
    str += " Possible matches [#{account_list.chomp(',')}]"
  end
  puts str
end