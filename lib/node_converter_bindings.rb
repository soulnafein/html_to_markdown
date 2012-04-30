require "node_converters"

module HtmlToMarkdown
  module NodeConverterBindings

  	@@Converters = { "h1" => HeaderConverter.new("="),
	                 "h2" => HeaderConverter.new("-"),
	                 "text" => TextConverter.new,
	                 "ul" => UnorderedListConverter.new,
	                 "ol" => OrderedListConverter.new,
	                 "p" => BlockWrapper.new,
	                 "div" => BlockWrapper.new,
	                 "img" => ImageWrapper.new,
                   "a" => LinkWrapper.new,
	                 "strong" => NodeWrapper.new("**", "**"),
	                 "em" => NodeWrapper.new("_", "_"),
	               }
	
	@@Converters.default = NodeWrapper.new("", "")
    
    def self.get_converter_for(node)
      @@Converters[node.name]
    end
  end
end
