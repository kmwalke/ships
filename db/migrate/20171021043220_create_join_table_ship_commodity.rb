class CreateJoinTableShipCommodity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ships, :commodities do |t|
      t.index [:ship_id, :commodity_id]
      t.index [:commodity_id, :ship_id]
    end
  end
end
