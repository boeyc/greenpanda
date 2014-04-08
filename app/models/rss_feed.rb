class RssFeed < ActiveRecord::Base

  def self.pull_feeds
    urls = []
    a = RssFeed.all
    a.each do |source|
      urls << source.url
    end


    feeds = Feedjira::Feed.fetch_and_parse urls


    urls.each do |rss_url|
      feed = feeds[rss_url]
      entry = feed.entries

      entry.each do |listing|
        puts listing.url
      end

    end

  end
end
