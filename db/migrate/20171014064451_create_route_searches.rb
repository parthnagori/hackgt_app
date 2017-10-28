class CreateRouteSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :route_searches do |t|
      t.string :Source
      t.string :Destination

      t.timestamps
    end
  end
end
