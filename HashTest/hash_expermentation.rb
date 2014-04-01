require 'active_support/all'

module HashTest
  class HashExperimentation
    def initialize

    end

    def test_reverse_merge(options = {})
      default_hash = { :default => "shaleen", :country => "uk" }
      options.reverse_merge!(default_hash)

      puts options.inspect
    end

  end
end

x = HashTest::HashExperimentation.new
x.test_reverse_merge(:extra_value1 => "extra_value", :default => "KKK")
# options hash will override the default hash and any new keys