require "yaml"
require "pry"

def load_library(emoticons)
emoticons = YAML.load_file('./lib/emoticons.yml')
emoticons.each do |key, array|
    emoticons[key] = {}
    emoticons[key][:english] = array[0]
    emoticons[key][:japanese] = array[1]
  end 
end 
 

def get_japanese_emoticon(file_path, emoticon)
    sorry_message = "Sorry, that emoticon was not found"
  nds = load_library(file_path)
  nds.each do |key, hash|
    if emoticon == hash[:english]
      return hash[:japanese]
  end
 end
 unless nds.include?(emoticon)
 return sorry_message
 end
end 

def get_english_meaning(file_path, emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  nds = load_library(file_path)
  nds.each do |english_meaning_key, hash_nation_emoji|
    if emoticon == hash_nation_emoji[:japanese] && nds.keys.include?(english_meaning_key)
    return english_meaning_key
  end 
  end
  unless nds.include?(emoticon)
  return sorry_message
 end
end 

#sorry_message = "Sorry, that emoticon was not found"
  #returns the Japanese equivalent of an English grinning (FAILED - 1)
 
 
