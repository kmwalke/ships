class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.string :name
      t.string :affect
      t.references :ship, foreign_key: true

      t.timestamps
    end
  end
end
