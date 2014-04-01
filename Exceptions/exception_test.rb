module Exceptions
  class ExceptionTest
    def method_raises_exception
      begin
        1/0
      rescue
        warn "An exception occurred"
      end
    end
  end


end

e = Exceptions::ExceptionTest.new
e.method_raises_exception
