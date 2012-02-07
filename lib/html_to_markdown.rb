require "html_to_markdown/version"
require "nokogiri"

module HtmlToMarkdown
  # Your code goes here...
  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    output = ""
    doc.at_css("body").traverse do |node|
      if node.name == "h1"
      	output += "#{node.content}\n"
      	output += "=" * node.content.length
      	output += "\n\n"
      elsif node.name == "h2"
      	output += "#{node.content}\n"
      	output += "-" * node.content.length
      	output += "\n\n"
      end
    end
    puts output
    output
  end
end
