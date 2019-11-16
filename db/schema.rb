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

ActiveRecord::Schema.define(version: 2019_11_16_103933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "beams", force: :cascade do |t|
    t.string "name"
    t.string "energy_mode"
    t.string "technique"
    t.decimal "monitor_units", precision: 15, scale: 10
    t.decimal "gantry_angle_start", precision: 15, scale: 10
    t.decimal "gantry_angle_stop", precision: 15, scale: 10
    t.decimal "patient_support_angle", precision: 15, scale: 10
    t.decimal "collimator_angle", precision: 15, scale: 10
    t.integer "number_of_control_points"
    t.string "jaw_positions"
    t.text "isocenter"
    t.bigint "treatment_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_plan_id"], name: "index_beams_on_treatment_plan_id"
  end

  create_table "dvh_curves", force: :cascade do |t|
    t.string "name"
    t.decimal "min_dose", precision: 15, scale: 10
    t.decimal "max_dose", precision: 15, scale: 10
    t.decimal "mean_dose", precision: 15, scale: 10
    t.text "curve_points"
    t.bigint "treatment_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_plan_id"], name: "index_dvh_curves_on_treatment_plan_id"
  end

  create_table "image_3ds", force: :cascade do |t|
    t.string "name"
    t.text "grid_size"
    t.bigint "treatment_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_plan_id"], name: "index_image_3ds_on_treatment_plan_id"
  end

  create_table "isodoses", force: :cascade do |t|
    t.decimal "level", precision: 15, scale: 10
    t.decimal "volume", precision: 15, scale: 10
    t.bigint "treatment_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_plan_id"], name: "index_isodoses_on_treatment_plan_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.decimal "volume", precision: 15, scale: 10
    t.text "center_point"
    t.string "color"
    t.boolean "is_target_structure"
    t.bigint "image_3d_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_3d_id"], name: "index_structures_on_image_3d_id"
  end

  create_table "treatment_plans", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_fractions"
    t.decimal "planned_dose_per_fraction", precision: 15, scale: 10
    t.text "grid_size"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_treatment_plans_on_patient_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
