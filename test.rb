# require 'open-uri'
# require 'json'

# def is_word_real?(word)
#     url = "https://wagon-dictionary.herokuapp.com/#{word}"
#     response = open(url).read
#     json = JSON.parse(response)
#     json
# end

# p is_word_real?("test")["found"]
