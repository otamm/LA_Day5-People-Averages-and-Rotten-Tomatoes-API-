require 'json'
require 'net/http'

if !ENV.has_key?("ROTTEN_TOMATOES_API_KEY")
  puts "You need to set the ROTTEN_TOMATOES_API_KEY environment variable."
  exit 1
end

api_key = ENV["ROTTEN_TOMATOES_API_KEY"]#rotten tomatoes was having some server issues, the key will be added later on. The code works perfectly fine with the file.
uri = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=#{api_key}")

response = Net::HTTP.get(uri)
movie_data = JSON.parse(response)

#movie_data = JSON.parse(File.read('in_theaters.json'))
movies=movie_data["movies"].sort_by do |movie|
  -(movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"])# == movies.reverse
end

puts "In Theters Now: "
movies.each do |movie|
  print "#{(movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"])/2}"
  print " - #{movie["title"]} (#{movie["mpaa_rating"]}) starring "
  print "#{movie["abridged_cast"][0]["name"]}"
  actor=movie["abridged_cast"].first(3)
  actor.each_with_index do |name, i|
    print "#{name["name"]}"
    if i < actor.size-1
      print ","
    end
  end
  puts " "
end

