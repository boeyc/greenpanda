
module Reddata

  class Reddit

    NEWS_LISTINGS = []

    def self.fetch
      reddit = Snoo::Client.new
      reddit.log_in 'hempasino', '49405699'
      reddit  = reddit.get_listing :limit => 100
      listing =reddit['data']['children']

     listing.each do |hash|
     Reddit.filter_news_domain(hash)
     end


      return NEWS_LISTINGS
    end



    private

    def self.filter_news_domain(hash)

      domain = hash['data']['domain']
      filtered_items = ['imgur','self','youtube','jpg']
      unless filtered_items.any?{|s| domain.include?(s)}
          NEWS_LISTINGS << hash
      end

    end

  end
end

