# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171021043220) do

  create_table "commodities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "commodities_planets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "planet_id", null: false
    t.bigint "commodity_id", null: false
    t.integer "desired_price"
    t.index ["commodity_id", "planet_id"], name: "index_commodities_planets_on_commodity_id_and_planet_id"
    t.index ["planet_id", "commodity_id"], name: "index_commodities_planets_on_planet_id_and_commodity_id"
  end

  create_table "commodities_ships", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "ship_id", null: false
    t.bigint "commodity_id", null: false
    t.index ["commodity_id", "ship_id"], name: "index_commodities_ships_on_commodity_id_and_ship_id"
    t.index ["ship_id", "commodity_id"], name: "index_commodities_ships_on_ship_id_and_commodity_id"
  end

  create_table "components", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "affect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components_ships", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "ship_id", null: false
    t.bigint "component_id", null: false
    t.index ["component_id", "ship_id"], name: "index_components_ships_on_component_id_and_ship_id"
    t.index ["ship_id", "component_id"], name: "index_components_ships_on_ship_id_and_component_id"
  end

  create_table "planets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "ships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "color"
    t.bigint "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_ships_on_planet_id"
  end

  add_foreign_key "ships", "planets"
end
