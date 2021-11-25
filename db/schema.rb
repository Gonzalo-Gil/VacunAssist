# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_24_234524) do

  create_table "doses", force: :cascade do |t|
    t.integer "numeroDosis"
    t.integer "dias"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "esquema_id"
  end

  create_table "enfermedads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "esquemas", force: :cascade do |t|
    t.integer "cant_dosis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vacuna_id"
  end

  create_table "laboratorios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sedes", force: :cascade do |t|
    t.string "nombre"
    t.integer "calle"
    t.integer "numero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.date "fecha"
    t.integer "sede_id"
    t.integer "vacuna_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "estado"
    t.integer "enfermedad_id"
    t.string "lote"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
    t.string "apellido"
    t.integer "dni"
    t.date "fecha_nacimiento"
    t.integer "telefono"
    t.boolean "notificacion"
    t.string "medio_notificacion"
    t.integer "role"
    t.index ["email", "dni"], name: "index_users_on_email_and_dni", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacunas", force: :cascade do |t|
    t.integer "enfermedad_id"
    t.integer "cant_dosis"
    t.integer "laboratorio_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
  end

end
