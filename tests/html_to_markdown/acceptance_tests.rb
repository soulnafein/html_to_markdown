require_relative '../tests_setup.rb'

module HtmlToMarkdown
  class AcceptanceTests < MiniTest::Unit::TestCase
    def test_that_gem_can_convert_a_complex_html_document_to_markdown
      source_html = load_fixture('introduction_to_markdown.html')
      expected_markdown = load_fixture('introduction_to_markdown.markdown')
      assert_equal expected_markdown, HtmlToMarkdown.parse(source_html)
    end

    private 
    def load_fixture(fixture)
      file_path = File.join(File.dirname(__FILE__), '../fixtures', fixture)
      File.read(file_path)
    end
  end
end
