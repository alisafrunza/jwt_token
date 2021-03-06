ActiveRecord::Schema.define(version: 20180306083557) do

  create_table "address_books", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "job_title"
  end

  create_table "consumers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "secret"
    t.string "token"
    t.index ["email"], name: "index_consumers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true
  end

end
