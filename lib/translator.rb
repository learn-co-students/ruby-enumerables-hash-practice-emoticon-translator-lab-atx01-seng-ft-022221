require "pry"
require "yaml"

def load_library(path)
  emoticon=YAML.load_file(path)
  emoticon.each do |name, emote|
    emoticon[name]={}
    emoticon[name][:english]= emote[0]
    emoticon[name][:japanese]= emote [1]
  end
  emoticon
end

def get_japanese_emoticon(path, emoticon)
  library=load_library(path)
  library.each do |key, value|
      if value[:english]==emoticon
        return value[:japanese]
      end
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library=load_library(path)
  library.each do |key, value|
      if value[:japanese]==emoticon
          return key
      else
      end 
  end 
  return "Sorry, that emoticon was not found"
end