# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_28_205711) do

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "hospital_type"
    t.string "total_beds"
    t.string "county"
    t.string "county_fips_code"
    t.string "country"
    t.string "latitude"
    t.string "longitude"
    t.string "naics_code"
    t.string "website"
    t.string "owner"
    t.string "trauma"
    t.string "helipad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["total_beds"], name: "index_hospitals_on_total_beds"
    t.index ["trauma"], name: "index_hospitals_on_trauma"
    t.index ["zip_code"], name: "index_hospitals_on_zip_code"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mrn"
    t.string "zip_code"
    t.string "patient_status_code"
    t.integer "hospital_id", default: -1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
    t.index ["mrn"], name: "index_patients_on_mrn"
    t.index ["zip_code"], name: "index_patients_on_zip_code"
  end

  create_table "zip_distances", force: :cascade do |t|
    t.string "zip_from"
    t.string "zip_to"
    t.float "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["distance"], name: "index_zip_distances_on_distance"
    t.index ["zip_from"], name: "index_zip_distances_on_zip_from"
    t.index ["zip_to"], name: "index_zip_distances_on_zip_to"
  end

end
