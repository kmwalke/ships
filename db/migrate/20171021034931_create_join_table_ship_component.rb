class CreateJoinTableShipComponent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ships, :components do |t|
      t.index [:ship_id, :component_id]
      t.index [:component_id, :ship_id]
    end
  end
end
