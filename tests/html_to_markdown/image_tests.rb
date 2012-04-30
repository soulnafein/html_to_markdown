require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class ImageTests < MiniTest::Unit::TestCase
    def test_img_shown
      html = "<p>can i haz <img src='http://test.com/image.png' alt='images' /></p>"\
             "<p>yes you can!!</p>"

      markdown = "can i haz [images][image.png]\n" \
                  "[image.png]: http://test.com/image.png\n\n" \
                 "yes you can!!\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end

    def test_dummy_title_shown_for_images_without_alt
      html = "<div><img src='http://lala/img.jpg' /></div>"

      markdown = "[image][img.jpg]\n" \
                 "[img.jpg]: http://lala/img.jpg\n\n"

      assert_equal markdown, HtmlToMarkdown.parse(html)
    end
  end
end
