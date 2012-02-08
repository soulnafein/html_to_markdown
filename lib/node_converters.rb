require "nokogiri"
require "node_converter_bindings"

module HtmlToMarkdown

  module NodeConverter
    def get_children_text(node)
      node.children.inject("") {|acc, el| acc << NodeConverterBindings.get_converter_for(el).generate_markdown(el)}
    end
  end

  class NoMatchConverter
    include NodeConverter

    def generate_markdown(node)
      get_children_text(node)
    end
  end

  class HeaderOneConverter
    include NodeConverter

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

    def generate_markdown(node)
      "#{get_children_text(node)}\n\n"
    end
  end

  class StrongConverter
    include NodeConverter

    def generate_markdown(node)
      "**#{get_children_text(node)}**"
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