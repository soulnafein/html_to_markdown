module HtmlToMarkdown
  class OrderedAndUnorderedListsTests < MiniTest::Unit::TestCase
    def test_unordered_list_with_one_element
      html = "<ul><li>eggs</li></ul>"

      markdown = "*  eggs\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_unordered_list_with_two_elements
      html = "<ul><li>eggs</li><li>bacon</li></ul>"

      markdown = "*  eggs\n*  bacon\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_unordered_list_with_two_elements_with_inner_html
      html = "<ul><li><strong>eggs</strong></li><li><em>bacon</em></li></ul>"

      markdown = "*  **eggs**\n*  _bacon_\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_unordered_list_with_one_element
      html = "<ol><li>eggs</li></ol>"

      markdown = "1. eggs\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_unordered_list_with_two_elements
      html = "<ol><li>eggs</li><li>bacon</li></ol>"

      markdown = "1. eggs\n2. bacon\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_ordered_list_with_two_elements_with_inner_html
      html = "<ol><li><strong>eggs</strong></li><li><em>bacon</em></li></ol>"

      markdown = "1. **eggs**\n2. _bacon_\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end