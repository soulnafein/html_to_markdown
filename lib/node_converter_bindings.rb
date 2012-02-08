require "node_converters"

module HtmlToMarkdown
  module NodeConverterBindings

  	@@Converters = { "h1" => HeaderOneConverter.new,
	                 "h2" => HeaderTwoConverter.new,
	                 "text" => TextConverter.new,
	                 "p" => ParagraphConverter.new,
	                 "strong" => StrongConverter.new}
	
	@@Converters.default = NoMatchConverter.new
    
    def self.get_converter_for(node)
      @@Converters[node.name]
    end
  end
end