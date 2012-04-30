require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class HrefTests < MiniTest::Unit::TestCase
    def test_hyperlinks_are_supported
      html = "<div>can i haz <a href='http://test.com/hyperlinks'>links?</a></div>"

      markdown = "can i haz [links?][hyperlinks]\n" \
                 "[hyperlinks]: http://test.com/hyperlinks\n\n" 

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_href_are_shown_at_the_end_of_the_paragraph
      html = "<p>can i haz <a href='http://test.com/hyperlinks'>links?</a></p>"\
             "<p>yes you can!!</p>"

      markdown = "can i haz [links?][hyperlinks]\n" \
                  "[hyperlinks]: http://test.com/hyperlinks\n\n" \
                 "yes you can!!\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_duplicated_href_arent_repeated
      html = "<p>can i haz <a href='http://test.com/hyperlinks'>links?</a></p>"\
             "<p>yes you can!!<a href='http://test.com/hyperlinks'>repeat?</a></p>"

      markdown = "can i haz [links?][hyperlinks]\n" \
                  "[hyperlinks]: http://test.com/hyperlinks\n\n"\
                 "yes you can!![repeat?][hyperlinks]\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_new_link_reference_with_different_url
      html = "<p>can i haz <a href='http://lala.com/hyperlinks'>links?</a></p>"\
             "<p>yes you can!!<a href='http://another_url.com/hyperlinks'>repeat?</a></p>"

      markdown = "can i haz [links?][hyperlinks]\n" \
                 "[hyperlinks]: http://lala.com/hyperlinks\n\n"\
                 "yes you can!![repeat?][hyperlinks_1]\n"\
                 "[hyperlinks_1]: http://another_url.com/hyperlinks\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_anchors_should_stay_as_html
      html = "<p>ciao <a id='something-important' /></p>"
      markdown = "ciao <a id=\"something-important\" />\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end
