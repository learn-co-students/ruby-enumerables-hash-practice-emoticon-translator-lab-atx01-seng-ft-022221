# require modules here
require "yaml"
require "pry"

def load_library(file)
  emoticons = YAML.load_file(file)
 
  emoticons.each_with_object ({}) do |(key, value), moods_hash|
    if !moods_hash[key] 
      moods_hash[key] = {:english => value[0], :japanese => value[1]}
    end
  end
end 
  
  def get_english_meaning(file, value)
  library = load_library(file)
  value = library.keys.find do |key|
    library[key][:japanese] == value 
  end 
  value ? value : "Sorry, that emoticon was not found"
end 


def get_japanese_emoticon(file, value)
  library = load_library(file)
  value = library.keys.find do |key|
    library[key][:english] == value
  end
  value ? library[value][:japanese] : "Sorry, that emoticon was not found"
end 
