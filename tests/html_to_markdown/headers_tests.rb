require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class HeadersTests < MiniTest::Unit::TestCase
    def test_that_h1_are_converted_correctly
      html = "<h1>An header</h1>"
      markdown = "An header\n" + 
                 "=========\n\n"
      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_that_h2_are_converted_correctly
      html = "<h2>An header</h2>"
      markdown = "An header\n" + 
                 "---------\n\n"
      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_bold
      html = "<strong>bold makes me fatter</strong>"

      markdown = "**bold makes me fatter**"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end



    def test_just_text
      html = "<div>sometimes we just have text</div>"
      markdown = "sometimes we just have text\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end
