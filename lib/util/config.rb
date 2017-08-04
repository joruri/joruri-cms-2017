class Util::Config
  @@cache = {}
  
  def self.load(name, attribute = nil, options = {})
    name = name.to_s
    section = options[:section]
    yml = self.read(name, section)
    
    return yml unless attribute
    return yml[attribute.to_s]
  end
  
private
  def self.read(filename, section)
    unless @@cache[filename]
      config = Rails.root.join("config/#{filename}.yml").to_s
      @@cache[filename] = YAML.load(ERB.new(IO.read(config)).result)
    end

    if section == false
      return @@cache[filename]
    elsif section
      return @@cache[filename][section.to_s]
    else
      return @@cache[filename][Rails.env]
    end
  end
end
