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

ActiveRecord::Schema.define(version: 20180217193548) do

  create_table "action_results", force: :cascade do |t|
    t.integer "workshop_id"
    t.integer "lookup_process_stage_id"
    t.integer "ar_number"
    t.string "action"
    t.string "result"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_action_results_on_active"
    t.index ["ar_number"], name: "index_action_results_on_ar_number"
    t.index ["lookup_process_stage_id"], name: "index_action_results_on_lookup_process_stage_id"
    t.index ["workshop_id"], name: "index_action_results_on_workshop_id"
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

  create_table "comments", force: :cascade do |t|
    t.integer "status_update_id"
    t.integer "comment_id"
    t.integer "person_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comments_on_comment_id"
    t.index ["person_id"], name: "index_comments_on_person_id"
    t.index ["status_update_id"], name: "index_comments_on_status_update_id"
  end

  create_table "customer_jobs", force: :cascade do |t|
    t.integer "process_owner_id"
    t.integer "customer_id"
    t.string "job_name"
    t.text "job_description"
    t.string "ref_number"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_customer_jobs_on_active"
    t.index ["customer_id"], name: "index_customer_jobs_on_customer_id"
    t.index ["process_owner_id"], name: "index_customer_jobs_on_process_owner_id"
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

  create_table "group_associations", force: :cascade do |t|
    t.string "type"
    t.integer "person_id"
    t.integer "workshop_id"
    t.integer "customer_job_id"
    t.integer "supplier_order_id"
    t.integer "toe_tag_id"
    t.integer "lookup_id"
    t.index ["customer_job_id"], name: "index_group_associations_on_customer_job_id"
    t.index ["lookup_id"], name: "index_group_associations_on_lookup_id"
    t.index ["person_id"], name: "index_group_associations_on_person_id"
    t.index ["supplier_order_id"], name: "index_group_associations_on_supplier_order_id"
    t.index ["toe_tag_id"], name: "index_group_associations_on_toe_tag_id"
    t.index ["workshop_id"], name: "index_group_associations_on_workshop_id"
  end

  create_table "lookups", force: :cascade do |t|
    t.string "type"
    t.integer "sequence"
    t.string "short_text"
    t.string "long_text"
    t.text "description"
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "process_owner_id"
    t.integer "date_lookup_id"
    t.integer "metric_id"
    t.integer "person_id"
    t.decimal "value"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_measurements_on_active"
    t.index ["date_lookup_id"], name: "index_measurements_on_date_lookup_id"
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
    t.index ["person_id"], name: "index_measurements_on_person_id"
    t.index ["process_owner_id"], name: "index_measurements_on_process_owner_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.integer "process_owner_id"
    t.integer "action_result_id"
    t.string "name"
    t.string "datatype"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_result_id"], name: "index_metrics_on_action_result_id"
    t.index ["active"], name: "index_metrics_on_active"
    t.index ["process_owner_id"], name: "index_metrics_on_process_owner_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "city_and_state"
    t.boolean "active", default: true
    t.boolean "process_owner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_organizations_on_active"
    t.index ["process_owner"], name: "index_organizations_on_process_owner"
  end

  create_table "pain_points", force: :cascade do |t|
    t.integer "action_result_id"
    t.integer "toe_tag_id"
    t.text "symptom"
    t.text "impact"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_result_id"], name: "index_pain_points_on_action_result_id"
    t.index ["active"], name: "index_pain_points_on_active"
    t.index ["toe_tag_id"], name: "index_pain_points_on_toe_tag_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "job_title"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_people_on_active"
    t.index ["organization_id"], name: "index_people_on_organization_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "related_orgs", force: :cascade do |t|
    t.integer "process_owner_id"
    t.string "partner_type"
    t.integer "partner_id"
    t.index ["partner_type", "partner_id"], name: "index_related_orgs_on_partner_type_and_partner_id"
    t.index ["process_owner_id"], name: "index_related_orgs_on_process_owner_id"
  end

  create_table "status_updates", force: :cascade do |t|
    t.integer "date_lookup_id"
    t.integer "person_id"
    t.integer "process_owner_id"
    t.integer "customer_id"
    t.integer "supplier_id"
    t.integer "customer_job_id"
    t.integer "supplier_order_id"
    t.integer "toe_tag_id"
    t.integer "action_result_id"
    t.integer "pain_point_id"
    t.integer "workshop_id"
    t.integer "metric_id"
    t.text "type"
    t.text "attachment"
    t.text "text"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_result_id"], name: "index_status_updates_on_action_result_id"
    t.index ["active"], name: "index_status_updates_on_active"
    t.index ["customer_id"], name: "index_status_updates_on_customer_id"
    t.index ["customer_job_id"], name: "index_status_updates_on_customer_job_id"
    t.index ["date_lookup_id"], name: "index_status_updates_on_date_lookup_id"
    t.index ["metric_id"], name: "index_status_updates_on_metric_id"
    t.index ["pain_point_id"], name: "index_status_updates_on_pain_point_id"
    t.index ["person_id"], name: "index_status_updates_on_person_id"
    t.index ["process_owner_id"], name: "index_status_updates_on_process_owner_id"
    t.index ["supplier_id"], name: "index_status_updates_on_supplier_id"
    t.index ["supplier_order_id"], name: "index_status_updates_on_supplier_order_id"
    t.index ["toe_tag_id"], name: "index_status_updates_on_toe_tag_id"
    t.index ["workshop_id"], name: "index_status_updates_on_workshop_id"
  end

  create_table "supplier_orders", force: :cascade do |t|
    t.integer "process_owner_id"
    t.integer "supplier_id"
    t.string "order_name"
    t.string "ref_number"
    t.text "order_description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_supplier_orders_on_active"
    t.index ["process_owner_id"], name: "index_supplier_orders_on_process_owner_id"
    t.index ["supplier_id"], name: "index_supplier_orders_on_supplier_id"
  end

  create_table "toe_tags", force: :cascade do |t|
    t.integer "workshop_id"
    t.integer "priority"
    t.string "big_small_now"
    t.string "lookup_solution_type"
    t.string "solution"
    t.string "success_measurement"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_toe_tags_on_active"
    t.index ["workshop_id"], name: "index_toe_tags_on_workshop_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "active", default: true
    t.boolean "banned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_users_on_active"
    t.index ["banned"], name: "index_users_on_banned"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.integer "date_lookup_id"
    t.integer "process_owner_id"
    t.text "capability_goal"
    t.text "process_name"
    t.text "process_description"
    t.text "left_boundary"
    t.text "right_boundary"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_workshops_on_active"
    t.index ["date_lookup_id"], name: "index_workshops_on_date_lookup_id"
    t.index ["process_owner_id"], name: "index_workshops_on_process_owner_id"
  end

end
