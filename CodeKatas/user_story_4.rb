require '../CodeKatas/user_story_2'
require '../CodeKatas/user_story_1'


x = CodeKatas::UserStory1.new("./bank_accounts_4.txt")
x.read_file_and_list_account_numbers

x.output_accounts.each do |account|
  accounts = []
  account_list = ""
  if account.possible_matches && account.possible_matches.length > 0
    account.original_account_number = String.new(account.account_number)
    if account.possible_matches && account.possible_matches.length > 0
      account.possible_matches.each do |poss|
        temp = String.new(account.account_number)
        temp[poss[0][1]] = poss[0][0].to_s
        accounts << temp
      end
    end

    accounts.each do |acc|
      account_list += acc + ","
    end
    puts "Possible match for #{account.original_account_number} are: #{account_list.chomp(',')}"
  else
    str = ""
    str += "Account Number #{account.account_number}"
    possibilities = CodeKatas::UserStory2.new(account.account_number).other_possible_numbers
    possibilities.each do |possible|
      matching_check_sum = []
      if CodeKatas::UserStory2.new(possible.join('')).check_sum_of_account_number == "Valid Account"
        matching_check_sum << possible
      end
      account_list = ""
      matching_check_sum.each do |matching_acc_number|
        account_list += matching_acc_number.join("") + ","
      end
      amber = ""
      if matching_check_sum && matching_check_sum.length == 1
        str += " Possible match #{amber} [#{account_list.chomp(',')}]"
      elsif matching_check_sum && matching_check_sum.length > 1
        amber = "AMB"
        str += " Possible matches  #{amber} [#{account_list.chomp(',')}]"
      end
    end
    puts str
  end

end