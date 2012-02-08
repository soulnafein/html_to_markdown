require "node_converters"

module HtmlToMarkdown
  module NodeConverterBindings
  	@@Converters = {"h1" => HeaderOneConverter.new, "h2" => HeaderTwoConverter.new, "text" => TextConverter.new, "p" => ParagraphConverter.new, "strong" => StrongConverter.new}
  	@@NoMatchConverter = NoMatchConverter.new
    
    def self.get_converter_for(node)
      converter = @@Converters[node.name]
      converter = @@NoMatchConverter if converter == nil
      converter
    end
  end
end