class AddSubredditToListing < ActiveRecord::Migration
  def change
    add_column :listings, :subreddit, :string
  end
end
