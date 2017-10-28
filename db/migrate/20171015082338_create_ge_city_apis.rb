class CreateGeCityApis < ActiveRecord::Migration[5.1]
  def change
    create_table :ge_city_apis do |t|

      t.timestamps
    end
  end
end
