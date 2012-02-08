require "html_to_markdown/version"
require "nokogiri"

module HtmlToMarkdown
  # Your code goes here...
  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    RootConverter.new.generate_markdown(doc.at_css("body"))
  end

  module NodeConverter

    def match?(node)
      matched_elements.include?(node.name)
    end

    def get_children_text(node)
      node.children.inject("") {|acc, el| acc << get_converter(el).generate_markdown(el)}
    end

    def get_converter(node)
      @@converters ||= [HeaderOneConverter.new, HeaderTwoConverter.new, ParagraphConverter.new, TextConverter.new, StrongConverter.new, NoMatchConverter.new]
      @@converters.find{|el|el.match?(node)}
    end
  end

  class RootConverter
    include NodeConverter
    def generate_markdown(node)
      children_text = get_children_text(node)
    end
  end

  class NoMatchConverter
    include NodeConverter
    def match?(node)
      true
    end

    def generate_markdown(node)
      get_children_text(node)
    end
  end

  class HeaderOneConverter
    include NodeConverter
    def matched_elements
      ['h1']
    end

    def generate_markdown(node)
      children_text = get_children_text(node)
      output = "#{children_text}\n"
      output << "=" * children_text.length
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
      children_text = get_children_text(node)
      output = "#{children_text}\n"
      output << "-" * children_text.length
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
      "#{get_children_text(node)}\n\n"
    end
  end

  class StrongConverter
    include NodeConverter
    def matched_elements
      ['strong', 'b']
    end

    def generate_markdown(node)
      "**#{get_children_text(node)}**"
    end
  end

  class TextConverter
    include NodeConverter
    def matched_elements
      ['text']
    end

    def generate_markdown(node)
      output = ''
      output << node.content
      output
    end
  end
end
