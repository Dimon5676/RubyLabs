ActiveRecord::Schema.define(version: 2021_05_26_152425) do

  create_table "marks", force: :cascade do |t|
    t.integer "id", null: false
    t.integer "points"
    t.string "letter"
    t.datetime "create", precision: 6, null: false
    t.datetime "update", precision: 6, null: false
    t.index ["id"], name: "index_marks_on_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "create", precision: 6, null: false
    t.datetime "update", precision: 6, null: false
  end

  add_foreign_key "marks", "reports"
end


