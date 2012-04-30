require "nokogiri"
require "node_converter_bindings"

module HtmlToMarkdown

  module NodeConverter
    def get_children_text(node, references)
      node.children.inject("") {|acc, el| acc << NodeConverterBindings.get_converter_for(el).generate_markdown(el, references)}
    end
  end

  class HeaderConverter
    include NodeConverter

    def initialize(underline_symbol)
      @underline_symbol = underline_symbol
    end

    def generate_markdown(node, references)
      children_text = get_children_text(node, references)
      underline = @underline_symbol * children_text.length
      children_text + "\n" + underline + "\n\n"
    end
  end

  class UnorderedListConverter
    def generate_markdown(node, references)
      node.children.inject("") {|acc, el| acc << "*  " + NodeConverterBindings.get_converter_for(el).generate_markdown(el, references) + "\n"}
    end
  end

  class OrderedListConverter
    def generate_markdown(node, references)
      output = ""
      count = 1
      node.children.each do |el|
        output << "#{count}. " + NodeConverterBindings.get_converter_for(el).generate_markdown(el, references) + "\n"
        count += 1
      end
      output
    end
  end

  class NodeWrapper
    include NodeConverter

    def initialize(before, after)
      @before = before
      @after = after
    end

    def generate_markdown(node, references)
      @before + get_children_text(node, references) + @after
    end
  end

  class BlockWrapper
    include NodeConverter

    def generate_markdown(node, references)
      get_children_text(node, references) + "\n" + references.as_index! + "\n"
    end
  end

  class LinkWrapper
    include NodeConverter

    def generate_markdown(node, references)
      url = node.attributes["href"].value
      name = references.add(url)
      "[" + get_children_text(node, references) + "][" + name + "]"
    end
  end

  class ImageWrapper
    include NodeConverter

    def generate_markdown(node, references)
      url = node.attributes["src"].value
      name = references.add(url)
      title = node.attributes["alt"].nil? ? "image" : node.attributes["alt"].value
      "[" + title + "][" + name + "]"
    end
  end

  class TextConverter
    include NodeConverter

    def generate_markdown(node, references)
      node.content
    end
  end
end
