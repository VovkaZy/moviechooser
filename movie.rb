require 'rubygems'
require 'mechanize'

agent = Mechanize.new

chosen = false

until chosen
  page = agent.get('https://www.imdb.com/chart/top')
  tr_tag = page.search('.//tr').to_a.sample
  movie_title = tr_tag.search("td[@class = 'titleColumn']/a").text
  movie_year = tr_tag.search("span[@class = 'secondaryInfo']").text
  imdb_rate = tr_tag.search("td[@class = 'ratingColumn imdbRating']").text
  movie_disctiption = tr_tag.search("td[@class = 'titleColumn']/a/@title").text

  puts '+---------------------------------------------------------------------+'
  puts "| >>>>>>>>>>>>> #{movie_title} <<<<<<<<<<<<<"
  puts '+---------------------------------------------------------------------+'
  puts "Dir./actors: #{movie_disctiption}"
  puts "Year: #{movie_year}"
  puts "IMDb rating: #{imdb_rate}"

  puts 'Start watching? (y/n)'

  choice = STDIN.gets.chomp

  if choice.casecmp('y').zero?
    chosen = true
  else
    puts 'Choosing new movie for you'
  end
end
