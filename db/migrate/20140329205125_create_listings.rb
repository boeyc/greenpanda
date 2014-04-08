class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :domain
      t.string :thumbnail_url
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
