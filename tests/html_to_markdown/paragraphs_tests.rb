require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class ParagraphsTests < MiniTest::Unit::TestCase
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
  end
end