require 'reddata/reddit'

class Listing < ActiveRecord::Base
  def self.create_from_reddit
    klass = Reddata::Reddit

    listing = klass.fetch


    listing.each do |news_item|

      unless Listing.exists?(:url => news_item['data']['url'])
      create_params = {

          :domain         => news_item['data']['domain'],
          :thumbnail_url  => news_item['data']['thumbnail'],
          :url            => news_item['data']['url'],
          :title          => news_item['data']['title'],
          :subreddit      => news_item['data']['subreddit']
      }


      create create_params
      end
    end
  end

  def self.check_filters

    Listing.each do |news_item|
      a = news_item['data']['url']
      if a.includes? 'jpg'
        destroy news_item

  end
    end
end


end
