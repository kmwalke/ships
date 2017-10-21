class CreateCommodities < ActiveRecord::Migration[5.1]
  def change
    create_table :commodities do |t|
      t.string :name
    end
  end
end
