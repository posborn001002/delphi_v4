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

ActiveRecord::Schema.define(version: 20180204022542) do

  create_table "action_results", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "ar_number"
    t.string "action"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ar_number"], name: "index_action_results_on_ar_number"
    t.index ["organization_id"], name: "index_action_results_on_organization_id"
  end

  create_table "action_results_customer_jobs", id: false, force: :cascade do |t|
    t.integer "customer_job_id", null: false
    t.integer "action_result_id", null: false
    t.index ["action_result_id"], name: "index_action_results_customer_jobs_on_action_result_id"
    t.index ["customer_job_id"], name: "index_action_results_customer_jobs_on_customer_job_id"
  end

  create_table "action_results_supplier_orders", id: false, force: :cascade do |t|
    t.integer "supplier_order_id", null: false
    t.integer "action_result_id", null: false
    t.index ["action_result_id"], name: "index_action_results_supplier_orders_on_action_result_id"
    t.index ["supplier_order_id"], name: "index_action_results_supplier_orders_on_supplier_order_id"
  end

  create_table "attendees", id: false, force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "person_id", null: false
    t.index ["person_id"], name: "index_attendees_on_person_id"
    t.index ["workshop_id"], name: "index_attendees_on_workshop_id"
  end

  create_table "customer_jobs", force: :cascade do |t|
    t.string "job_name"
    t.text "job_description"
    t.string "ref_number"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_customer_jobs_on_organization_id"
  end

  create_table "date_lookups", force: :cascade do |t|
    t.date "date"
    t.integer "day_of_month"
    t.integer "month"
    t.integer "quarter"
    t.integer "year"
    t.integer "week_of_year"
    t.integer "week_of_quarter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_date_lookups_on_date"
  end

  create_table "job_contacts", id: false, force: :cascade do |t|
    t.integer "customer_job_id", null: false
    t.integer "person_id", null: false
    t.index ["customer_job_id"], name: "index_job_contacts_on_customer_job_id"
    t.index ["person_id"], name: "index_job_contacts_on_person_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "date_lookup_id"
    t.integer "metric_id"
    t.integer "person_id"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_lookup_id"], name: "index_measurements_on_date_lookup_id"
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
    t.index ["person_id"], name: "index_measurements_on_person_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.integer "action_result_id"
    t.string "name"
    t.string "datatype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_result_id"], name: "index_metrics_on_action_result_id"
  end

  create_table "order_contacts", id: false, force: :cascade do |t|
    t.integer "supplier_job_id", null: false
    t.integer "person_id", null: false
    t.index ["person_id"], name: "index_order_contacts_on_person_id"
    t.index ["supplier_job_id"], name: "index_order_contacts_on_supplier_job_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "city_and_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pain_point_updates", force: :cascade do |t|
    t.integer "pain_point_id"
    t.integer "progress_id"
    t.integer "pass_fail_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pain_point_id"], name: "index_pain_point_updates_on_pain_point_id"
    t.index ["progress_id"], name: "index_pain_point_updates_on_progress_id"
  end

  create_table "pain_points", force: :cascade do |t|
    t.integer "workshop_id"
    t.text "symptom"
    t.text "impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workshop_id"], name: "index_pain_points_on_workshop_id"
  end

  create_table "pain_points_toe_tags", id: false, force: :cascade do |t|
    t.integer "toe_tag_id", null: false
    t.integer "pain_point_id", null: false
    t.index ["pain_point_id"], name: "index_pain_points_toe_tags_on_pain_point_id"
    t.index ["toe_tag_id"], name: "index_pain_points_toe_tags_on_toe_tag_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.string "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "related_orgs", id: false, force: :cascade do |t|
    t.integer "organization_id"
    t.string "partner_type"
    t.integer "partner_id"
    t.index ["organization_id"], name: "index_related_orgs_on_organization_id"
    t.index ["partner_type", "partner_id"], name: "index_related_orgs_on_partner_type_and_partner_id"
  end

  create_table "supplier_orders", force: :cascade do |t|
    t.string "order_name"
    t.string "ref_number"
    t.text "order_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", id: false, force: :cascade do |t|
    t.integer "toe_tag_id", null: false
    t.integer "person_id", null: false
    t.index ["person_id"], name: "index_teams_on_person_id"
    t.index ["toe_tag_id"], name: "index_teams_on_toe_tag_id"
  end

  create_table "toe_tags", force: :cascade do |t|
    t.integer "priority"
    t.string "big_small_now"
    t.string "solution"
    t.string "success_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.integer "date_lookup_id"
    t.integer "person_id"
    t.integer "action_result_id"
    t.integer "job_order_id"
    t.string "job_order_type"
    t.text "attachment"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_result_id"], name: "index_updates_on_action_result_id"
    t.index ["date_lookup_id"], name: "index_updates_on_date_lookup_id"
    t.index ["person_id"], name: "index_updates_on_person_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.integer "date_lookup_id"
    t.text "capability_goal"
    t.text "process_name"
    t.text "process_description"
    t.text "left_boundary"
    t.text "right_boundary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_lookup_id"], name: "index_workshops_on_date_lookup_id"
  end

end
