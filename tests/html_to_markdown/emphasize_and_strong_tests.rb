module HtmlToMarkdown
  class HeadersTests < MiniTest::Unit::TestCase
    def test_strong_are_converted_correctly
      html = "<strong>bold makes me fatter</strong>"

      markdown = "**bold makes me fatter**"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_em_are_converted_correctly
      html = "<em>bold makes me fatter</em>"

      markdown = "_bold makes me fatter_"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end