# account number:  3  4  5  8  8  2  8  6  5
# position names:  d9 d8 d7 d6 d5 d4 d3 d2 d1
# checksum calculation (d1 + 2*d2 + 3*d3 +..+ 9*d9) mod 11 = 0
module CodeKatas
  class UserStory2
    def initialize(account_number)
      @account_number = account_number
    end

    def check_sum_of_account_number
      account_number_array = convert_account_number_to_array
      calculate_check_sum(account_number_array) == 0 ? "Valid Account" : "Invalid Account"
    end

    private

    def calculate_check_sum(array)
      reversed_array = array.reverse!
      total = 0
      reversed_array.each_with_index do |item, index|
        total +=  item * (index + 1)
      end
      total % 11
    end

    def convert_account_number_to_array
      @account_number.to_s.scan(/./).map {|e| e.to_i }
    end
  end
end

k = CodeKatas::UserStory2.new(345882865)
puts k.check_sum_of_account_number

k = CodeKatas::UserStory2.new(123456788)
puts k.check_sum_of_account_number