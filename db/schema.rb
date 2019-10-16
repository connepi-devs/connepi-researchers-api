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

ActiveRecord::Schema.define(version: 20191016184257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instituicoes", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "regiao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicacaos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicacoes", force: :cascade do |t|
    t.string "publicacao"
    t.string "autor"
    t.string "instituicao"
    t.string "status"
    t.string "area"
    t.integer "ano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.bigint "instituicao_id"
    t.index ["area_id"], name: "index_publicacoes_on_area_id"
    t.index ["instituicao_id"], name: "index_publicacoes_on_instituicao_id"
  end

end
