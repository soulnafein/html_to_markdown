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
      underline = @underline_symbol * children_text.length
      children_text + "\n" + underline + "\n\n"
    end
  end

  class NodeWrapper
    include NodeConverter

    def initialize(before, after)
      @before = before
      @after = after
    end

    def generate_markdown(node)
      @before + get_children_text(node) + @after
    end
  end

  class TextConverter
    include NodeConverter

    def generate_markdown(node)
      node.content
    end
  end
end