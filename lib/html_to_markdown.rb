require "html_to_markdown/version"
require "nokogiri"

module HtmlToMarkdown
  # Your code goes here...
  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    output = ""
    doc.at_css("body").traverse do |node|
      if node.name == "h1"
      	output << "#{node.content}\n"
      	output << "=" * node.content.length
      	output << "\n\n"
      elsif node.name == "h2"
      	output << "#{node.content}\n"
      	output << "-" * node.content.length
      	output << "\n\n"
      elsif node.name == "p"
      	output << "#{node.content}\n\n"
      elsif node.name == "text"
      	output << node.content unless ["h1", "h2", "p"].include? node.parent.name
      end
    end
    output
  end
end
