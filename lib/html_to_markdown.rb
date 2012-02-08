require "html_to_markdown/version"
require "nokogiri"

module HtmlToMarkdown
  # Your code goes here...
  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    converters = [HeaderOneConverter.new, HeaderTwoConverter.new, ParagraphConverter.new, TextConverter.new]
    output = ""
    doc.at_css("body").traverse do |node|
      converter = converters.find {|c| c.match?(node)}
      output << converter.generate_markdown(node) unless converter.nil?
    end
    output
  end

  module NodeConverter
    def match?(node)
      puts matched_elements
      matched_elements.include?(node.name)
    end
  end

  class HeaderOneConverter
    include NodeConverter
    def matched_elements
      ['h1']
    end

    def generate_markdown(node)
      output = "#{node.content}\n"
      output << "=" * node.content.length
      output << "\n\n"
      output
    end
  end

  class HeaderTwoConverter
    include NodeConverter
    def matched_elements
      ['h2']
    end

    def generate_markdown(node)
      output = "#{node.content}\n"
      output << "-" * node.content.length
      output << "\n\n"
      output
    end
  end

  class ParagraphConverter
    include NodeConverter
    def matched_elements
      ['p']
    end

    def generate_markdown(node)
      "#{node.content}\n\n"
    end
  end

  class TextConverter
    include NodeConverter
    def matched_elements
      ['text']
    end

    def generate_markdown(node)
      output = ''
      output << node.content unless ["h1", "h2", "p"].include? node.parent.name
      output
    end
  end
end
