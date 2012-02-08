require "nokogiri"
require "node_converter_bindings"

module HtmlToMarkdown

  module NodeConverter
    def get_children_text(node)
      node.children.inject("") {|acc, el| acc << NodeConverterBindings.get_converter_for(el).generate_markdown(el)}
    end
  end

  class HeaderConverter
    include NodeConverter

    def initialize(underline_symbol)
      @underline_symbol = underline_symbol
    end

    def generate_markdown(node)
      children_text = get_children_text(node)
      output = "#{children_text}\n"
      output << @underline_symbol * children_text.length
      output << "\n\n"
      output
    end
  end

  class NodeWrapper
    include NodeConverter

    def initialize(before, after)
      @before = before
      @after = after
    end

    def generate_markdown(node)
      "#{@before}#{get_children_text(node)}#{@after}"
    end
  end

  class TextConverter
    include NodeConverter

    def generate_markdown(node)
      output = ''
      output << node.content
      output
    end
  end
end