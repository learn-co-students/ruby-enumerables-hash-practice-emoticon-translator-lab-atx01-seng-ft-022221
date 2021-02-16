# require modules here
require 'pry' 
require "yaml"
def load_library(path)
f_hash = {}
YAML.load_file(path).each do |x, y|
  f_hash[x] = {}
  f_hash[x][:english] = y[0]
  f_hash[x][:japanese] = y[1]
end
f_hash  # code goes here
end

def get_japanese_emoticon(path, emoticon)
  load_library(path).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
  # code goes here
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
    load_library(path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
  # code goes here
end