require "html_to_markdown/version"
require "nokogiri"

module HtmlToMarkdown
  # Your code goes here...
  def self.parse(html_document)
    doc = Nokogiri::HTML(html_document)
    output = ""
    doc.xpath('//h1').each do |node|
      output += "#{node.text}\n" + ("=" * node.text.length) + "\n\n"
    end
    doc.xpath('//h2').each do |node|
      output += "#{node.text}\n" + ("-" * node.text.length) + "\n\n"
    end

    output
  end
end
