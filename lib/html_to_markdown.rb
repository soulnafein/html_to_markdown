require "html_to_markdown/version"
require "nokogiri"
require "node_converter_bindings"
require "references"

module HtmlToMarkdown

  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    references = References.new
    NodeConverterBindings.get_converter_for(doc.at_css("body")).generate_markdown(doc.at_css("body"), references) + references.as_index!
  end

end
