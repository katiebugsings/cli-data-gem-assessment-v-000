require 'open-uri'
require 'pry'

class Scraper

def self.scrape_index_page(index_url)
index_url.delete!("\u0000")
  doc = Nokogiri::HTML(open(index_url))

  scraped_restaurants = []
  binding.pry
  doc.css("restaurant").each do |restaurant|
    binding.pry
    #restaurant_hash = {}
    restaurant_name = restaurant.css("restaurant-name").text

    restaurant_menu = restaurant.css("a").attribute("href").value
    binding.pry
    scraped_restaurants << {name: restaurant_name, menu: restaurant_menu}
  end
  scraped_restaurants
end

def self.scrape_menu(menu_url)
  doc = Nokogiri::HTML(open(menu_url))
  restaurant_hash = {}
  links = doc.css("item-container").children.css("a")
  links.each do |link|
    link = link.attribute("href").value

  if link.include?("https://www.thehenryford.org/docs/default-source/default-document-library/eagle-tavern-spring-menu-2017.pdf?sfvrsn=2")
    restaurant_hash[link] = "https://www.thehenryford.org/docs/default-source/default-document-library/eagle-tavern-spring-menu-2017.pdf?sfvrsn=2"
  elsif link.include?("https://www.thehenryford.org/docs/default-source/default-document-library/789--cotswold-tea-menu-2.pdf?sfvrsn=2")
    restaurant_hash[link] = "https://www.thehenryford.org/docs/default-source/default-document-library/789--cotswold-tea-menu-2.pdf?sfvrsn=2"
  elsif link.include?("https://www.thehenryford.org/docs/default-source/default-document-library/mrs-fishers-menu-2018.pdf?sfvrsn=ae7f3801_2")
    restaurant_hash[link] = "https://www.thehenryford.org/docs/default-source/default-document-library/mrs-fishers-menu-2018.pdf?sfvrsn=ae7f3801_2"
      end
    end
  end
end
  # Responsible for scraping
