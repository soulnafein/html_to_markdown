require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class HeadersTests < MiniTest::Unit::TestCase
    def test_that_h1_are_converted_correctly
      html = "<h1>An header</h1>"
      markdown = "An header\n" + 
                 "=========\n\n"
      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_that_headers_are_added_in_the_right_order
      html = "<body><div class='some_div'><div class='more_div'><h1>An header</h1></div></div>" +
             "<div class='another_div'><h2>Another header</h2></div></body>"

      markdown = "An header\n" + 
                 "=========\n\n" +
                 "Another header\n" +
                 "--------------\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_that_headers_are_added_in_the_right_order_when_h1_is_after_h2
      html = "<body><div class='some_div'><div class='more_div'><h2>An header</h2></div></div>" +
             "<div class='another_div'><h1>Another header</h1></div></body>"

      markdown = "An header\n" + 
                 "---------\n\n" +
                 "Another header\n" +
                 "==============\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_paragraphs_are_converted
      html = "<p>can i haz paragraphs</p>"

      markdown = "can i haz paragraphs\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_multiple_paragraphs_are_separated
      html = "<p>can i haz paragraphs</p>"\
             "<p>yes you can!!</p>"

      markdown = "can i haz paragraphs\n\n"\
                 "yes you can!!\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_bold
      html = "<strong>bold makes me fatter</strong>"

      markdown = "** bold makes me fatter **"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_bold_inside_p
      html = "<p>me p <strong>me strong</strong>me close</p>"

      markdown = "me p ** me strong **me close\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_just_text
      html = "<div>sometimes we just have text</div>"
      markdown = "sometimes we just have text"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end
