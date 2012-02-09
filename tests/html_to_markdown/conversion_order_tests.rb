require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class OrderTests < MiniTest::Unit::TestCase

    def test_that_headers_are_added_in_the_right_order_when_h1_is_before_h2
      html = "<h1>An header</h1>" +
             "<h2>Another header</h2>"

      markdown = "An header\n" + 
                 "=========\n\n" +
                 "Another header\n" +
                 "--------------\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

  	def test_that_headers_are_added_in_the_right_order_when_h1_is_after_h2
      html = "<h2>An header</h2>" +
             "<h1>Another header</h1>"

      markdown = "An header\n" + 
                 "---------\n\n" +
                 "Another header\n" +
                 "==============\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_that_inner_html_is_converted_first
      html = "<p>me p <strong>me strong</strong> me close</p>"

      markdown = "me p **me strong** me close\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

  end
end