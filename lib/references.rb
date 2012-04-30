class References
  def initialize()
    @paragraph = {}
    @document = {}
  end

  def add(url)
    return @document[url] if !@document[url].nil?

    name = generate_name(url)
    @paragraph[url] = name
    @document[url] = name
    name
  end
  
  def generate_name(url)
    return @document[url] if !@document[url].nil?

    name = url[/([^\/]*)$/]
    return name if !@document.value? name

    return find_unique_name(name)
  end

  def find_unique_name(name)
    counter = 1
    while @document.value? "#{name}_#{counter}"
      counter += 1
    end

    "#{name}_#{counter}"
  end

  def as_index!()
    result = @paragraph.inject(""){|acc,pair| url, name = pair; acc << "[#{name}]: #{url}\n"}
    @paragraph = {}
    result
  end
end
