class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :color
      t.references :planet, foreign_key: true

      t.timestamps
    end
  end
end
