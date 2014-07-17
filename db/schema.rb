# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140717004637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: true do |t|
    t.string   "tema"
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "archivo"
    t.integer  "integrante_id"
    t.string   "url"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articulos", ["integrante_id"], name: "index_articulos_on_integrante_id", using: :btree

  create_table "centros_investigaciones", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", force: true do |t|
    t.integer  "integrante_id"
    t.integer  "articulo_id"
    t.text     "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comentarios", ["articulo_id"], name: "index_comentarios_on_articulo_id", using: :btree
  add_index "comentarios", ["integrante_id"], name: "index_comentarios_on_integrante_id", using: :btree

  create_table "contactos", force: true do |t|
    t.integer  "direccion_id"
    t.string   "tel"
    t.string   "email"
    t.string   "pag_web"
    t.string   "contactable_type"
    t.string   "contactable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contactos", ["direccion_id"], name: "index_contactos_on_direccion_id", using: :btree

  create_table "direcciones", force: true do |t|
    t.string   "calle"
    t.string   "colonia"
    t.integer  "municipio_id"
    t.integer  "cp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "direcciones", ["municipio_id"], name: "index_direcciones_on_municipio_id", using: :btree

  create_table "empresas", force: true do |t|
    t.string   "nombre"
    t.string   "giro"
    t.string   "no_empleados"
    t.string   "persona_fiscal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", force: true do |t|
    t.string   "nombre"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["pais_id"], name: "index_estados_on_pais_id", using: :btree

  create_table "estudiantes", force: true do |t|
    t.integer  "persona_id"
    t.integer  "institucion_educativa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estudiantes", ["institucion_educativa_id"], name: "index_estudiantes_on_institucion_educativa_id", using: :btree
  add_index "estudiantes", ["persona_id"], name: "index_estudiantes_on_persona_id", using: :btree

  create_table "externos", force: true do |t|
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "externos", ["persona_id"], name: "index_externos_on_persona_id", using: :btree

  create_table "grupos", force: true do |t|
    t.string   "tipo"
    t.string   "nombre"
    t.text     "objetivo"
    t.boolean  "privado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instituciones_educativas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integrantes", force: true do |t|
    t.integer  "persona_id"
    t.integer  "grupo_id"
    t.boolean  "admon"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integrantes", ["grupo_id"], name: "index_integrantes_on_grupo_id", using: :btree
  add_index "integrantes", ["persona_id"], name: "index_integrantes_on_persona_id", using: :btree

  create_table "investigadores", force: true do |t|
    t.integer  "persona_id"
    t.integer  "centro_investigacion_id"
    t.boolean  "promep"
    t.boolean  "sni"
    t.boolean  "tc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investigadores", ["centro_investigacion_id"], name: "index_investigadores_on_centro_investigacion_id", using: :btree
  add_index "investigadores", ["persona_id"], name: "index_investigadores_on_persona_id", using: :btree

  create_table "municipios", force: true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "municipios", ["estado_id"], name: "index_municipios_on_estado_id", using: :btree

  create_table "notificaciones", force: true do |t|
    t.integer  "integrante_id"
    t.string   "notificable_type"
    t.string   "notificable_id"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notificaciones", ["integrante_id"], name: "index_notificaciones_on_integrante_id", using: :btree

  create_table "paises", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.string   "nombre"
    t.string   "apellido_pat"
    t.string   "apellido_mat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representantes", force: true do |t|
    t.integer  "contacto_id"
    t.string   "representable_type"
    t.string   "representable_id"
    t.string   "puesto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "representantes", ["contacto_id"], name: "index_representantes_on_contacto_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
