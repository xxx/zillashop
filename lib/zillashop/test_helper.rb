# include Zillashop::TestHelper in your test/spec_helper file
# to avoid hitting shipzilla during tests.
class Zillashop
  module TestHelper
    def self.included(base)
      Zillashop.class_eval do
        def search(*args)
          {}
        end
      end
    end
  end
end
