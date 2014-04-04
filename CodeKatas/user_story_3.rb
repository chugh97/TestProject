require '../CodeKatas/user_story_2'
require '../CodeKatas/user_story_1'

module CodeKatas
  class UserStory3
    def initialize(options)
      @parser = options[:parser]
      @validator_klass = options[:validator_klass]
    end

    def check_and_report
      @parser.read_file_and_list_account_numbers

      @parser.output_accounts.each do |account|
        validation_status = @validator_klass.new(account).check_sum_of_account_number
        puts "#{account.account_number} #{validation_status}"
      end
    end

  end
end

x = CodeKatas::UserStory3.new(:validator_klass => CodeKatas::UserStory2, :parser => CodeKatas::UserStory1.new("./bank_accounts_4.txt"))

x.check_and_report
