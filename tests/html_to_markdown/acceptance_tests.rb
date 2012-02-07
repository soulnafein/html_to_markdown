require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class AcceptanceTests < MiniTest::Unit::TestCase
    def test_that_asserts_work
      puts "Running"
      name = 'David'
      assert_equal 'David', name
    end
  end
end
