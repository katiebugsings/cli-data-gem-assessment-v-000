require 'pry'
class HenryFord::Cli

  def call
    puts "Welcome to Henry Ford Museum CLI"
    binding.pry
    Scraper.scrape_index_page("https://www.thehenryford.org/visit/greenfield-village/shops-and-dining/ ")
  end


end
