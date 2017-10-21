class CreateJoinTablePlanetCommodity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :planets, :commodities do |t|
      t.index [:planet_id, :commodity_id]
      t.index [:commodity_id, :planet_id]
      t.integer :desired_price
    end
  end
end
