require 'open-uri'
require 'pry'

class Scraper

def self.scrape_index_page(index_url)
  doc = nokogiri :: HTML(open(index_url))

  scraped_restaurants = []
  doc.css("restaurant").each do |restaurant|
    restaurant_hash = {}
    restaurant_hash = [:name] = restaurant.css("restaurant-name").text

    restaurant_hash[:menu] = restaurant.css("a").attribute("href").valued
  end
  scraped_restaurants
end

def self.scrape_menu(menu_url)
  doc = nokogiri :: HTML(open(menu_url))
  restaurant_hash = {}
  links = doc.css("item-container").children.css("a")
  links.each do |link|
    link = link.attribute("href").value

  if link.include?("https://www.thehenryford.org/docs/default-source/default-document-library/eagle-tavern-spring-menu-2017.pdf?sfvrsn=2")
    restaurant_hash[:https://www.thehenryford.org/docs/default-source/default-document-library/eagle-tavern-spring-menu-2017.pdf?sfvrsn=2] = link
  elsif link.include?("https://www.thehenryford.org/docs/default-source/default-document-library/789--cotswold-tea-menu-2.pdf?sfvrsn=2")
    restaurant_hash[:https://www.thehenryford.org/docs/default-source/default-document-library/789--cotswold-tea-menu-2.pdf?sfvrsn=2] = link
    end
  end
end
  # Responsible for scraping

