class CreateUrlShorts < ActiveRecord::Migration[7.0]
  def change
    create_table :url_shorts do |t|
      t.string :url
      t.string :shorturl
      t.integer :clicks
      t.string :ipaddress
      t.string :country

      t.timestamps
    end
  end
end
