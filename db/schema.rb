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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aluno", primary_key: "cpf", force: :cascade do |t|
    t.string "nome",       limit: 50, null: false
    t.string "rg",         limit: 9,  null: false
    t.date   "nascimento",            null: false
    t.string "sexo",       limit: 1,  null: false
  end

  create_table "aluno_graduacao", primary_key: "cpf", force: :cascade do |t|
    t.decimal "semestre_atual",           precision: 1, null: false
    t.string  "isento",         limit: 1,               null: false
    t.date    "data_inicio",                            null: false
    t.integer "id_curso",                               null: false
  end

  create_table "aluno_pos", primary_key: "cpf", force: :cascade do |t|
    t.integer "id_bolsa"
    t.decimal "semestre_atual",           precision: 1, null: false
    t.string  "isento",         limit: 1,               null: false
    t.date    "data_inicio",                            null: false
    t.integer "id_projeto",                             null: false
    t.integer "id_curso",                               null: false
  end

  add_index "aluno_pos", ["id_bolsa"], name: "fkrecebe_id", unique: true, using: :btree
  add_index "aluno_pos", ["id_projeto"], name: "fkassociado_ind", using: :btree

  create_table "areas_de_pesquisa", primary_key: "id_area", force: :cascade do |t|
    t.string "area_do_conhecimento", limit: 30, null: false
    t.string "subdivisao",           limit: 30, null: false
    t.string "nome_area",            limit: 30, null: false
  end

  create_table "artigos_cientificos", primary_key: "id_artigo", force: :cascade do |t|
    t.date    "ano_publicacao",               null: false
    t.string  "veiculo_publicado", limit: 30, null: false
    t.integer "id_projeto",                   null: false
  end

  add_index "artigos_cientificos", ["id_projeto"], name: "fkproduz_ind", using: :btree

  create_table "biblioteca", primary_key: "id_biblioteca", force: :cascade do |t|
    t.integer "id_departamento",            null: false
    t.string  "nome_biblioteca", limit: 30, null: false
  end

  add_index "biblioteca", ["id_departamento"], name: "fkcoordena2_id", unique: true, using: :btree

  create_table "bolsas", primary_key: "id_bolsa", force: :cascade do |t|
    t.float   "valor_bolsa",                      null: false
    t.string  "entidade_financiadora", limit: 30, null: false
    t.integer "id_projeto",                       null: false
  end

  add_index "bolsas", ["id_projeto"], name: "fkgera_ind", using: :btree

  create_table "cadastro", primary_key: "id_cadastro", force: :cascade do |t|
    t.decimal "cpf",                         precision: 11, null: false
    t.date    "validade_cadastro",                          null: false
    t.decimal "n_devolucoes",                precision: 5,  null: false
    t.decimal "n_atrasos",                   precision: 5,  null: false
    t.string  "bloqueado",         limit: 1,                null: false
  end

  add_index "cadastro", ["cpf"], name: "fkdispoe_id", unique: true, using: :btree

  create_table "contratos", primary_key: "id_contrato", force: :cascade do |t|
    t.string  "modalidade",         limit: 30,                null: false
    t.date    "inicio_ferias",                                null: false
    t.date    "fim_ferias",                                   null: false
    t.float   "salario",                                      null: false
    t.date    "comeco_contrato",                              null: false
    t.date    "termino_contrato",                             null: false
    t.string  "cargo_comissionado", limit: 30
    t.integer "id_departamento",                              null: false
    t.decimal "id_registro",                   precision: 11
  end

  create_table "curso_graduacao", primary_key: "id_cgrad", force: :cascade do |t|
    t.string  "nome_curso",      limit: 30,               null: false
    t.decimal "duracao_ideal",              precision: 2, null: false
    t.string  "tipo_curso",      limit: 30,               null: false
    t.float   "mensalidade",                              null: false
    t.float   "taxa_inscricao",                           null: false
    t.integer "id_departamento"
  end

  add_index "curso_graduacao", ["id_departamento"], name: "fkadministra_ind", using: :btree

  create_table "curso_pos", primary_key: "id_cpos", force: :cascade do |t|
    t.string  "nome_curso",      limit: 30,               null: false
    t.decimal "duracao_ideal",              precision: 2, null: false
    t.string  "tipo_pos",        limit: 30,               null: false
    t.float   "mensalidade",                              null: false
    t.float   "taxa_inscricao",                           null: false
    t.integer "id_departamento"
  end

  add_index "curso_pos", ["id_departamento"], name: "fkgere_ind", using: :btree

  create_table "departamento", primary_key: "id_departamento", force: :cascade do |t|
    t.string "nome_departamento", limit: 30, null: false
  end

  create_table "disciplina_graduacao", primary_key: "id_disciplina", force: :cascade do |t|
    t.string  "nome_disciplina",     limit: 30,               null: false
    t.decimal "semestre_ideal",                 precision: 2, null: false
    t.decimal "carga_horaria",                  precision: 3, null: false
    t.decimal "creditos_oferecidos",            precision: 2, null: false
    t.integer "id_cgrad",                                     null: false
  end

  add_index "disciplina_graduacao", ["id_cgrad"], name: "fkcompoe_ind", using: :btree

  create_table "disciplina_pos", primary_key: "id_discpos", force: :cascade do |t|
    t.string  "nome_disciplina",     limit: 30,               null: false
    t.decimal "semestre_ideal",                 precision: 2, null: false
    t.decimal "carga_horaria",                  precision: 3, null: false
    t.decimal "creditos_oferecidos",            precision: 2, null: false
    t.integer "id_cpos",                                      null: false
  end

  add_index "disciplina_pos", ["id_cpos"], name: "fkcomposto_ind", using: :btree

  create_table "emprestimo", primary_key: "id_emprestimo", force: :cascade do |t|
    t.date    "data_inicio",               null: false
    t.decimal "dias_atraso", precision: 1, null: false
    t.integer "id_cadastro",               null: false
    t.integer "id_exemplar",               null: false
    t.date    "data_fim",                  null: false
  end

  add_index "emprestimo", ["id_cadastro"], name: "fkefetua_ind", using: :btree

  create_table "engloba", id: false, force: :cascade do |t|
    t.integer "id_projeto", null: false
    t.integer "id_area",    null: false
  end

  add_index "engloba", ["id_area"], name: "fkeng_are_ind", using: :btree

  create_table "exemplar", primary_key: "id_exemplar", force: :cascade do |t|
    t.string  "estado_conservacao", limit: 30, null: false
    t.string  "emprestado",         limit: 1,  null: false
    t.integer "id_livro",                      null: false
    t.integer "id_biblioteca",                 null: false
  end

  add_index "exemplar", ["id_biblioteca"], name: "fkcontem_ind", using: :btree
  add_index "exemplar", ["id_livro"], name: "fktem2_ind", using: :btree

  create_table "funcionario", primary_key: "id_funcionario", force: :cascade do |t|
    t.decimal "num_advertencias",            precision: 1, null: false
    t.string  "funcao",           limit: 30,               null: false
    t.string  "nivel_carreira",   limit: 30,               null: false
    t.integer "id_contrato",                               null: false
  end

  create_table "livro", primary_key: "id_livro", force: :cascade do |t|
    t.string  "titulo",    limit: 30,               null: false
    t.string  "autor",     limit: 30,               null: false
    t.decimal "n_paginas",            precision: 5, null: false
    t.string  "categoria", limit: 30,               null: false
  end

  create_table "participa", id: false, force: :cascade do |t|
    t.decimal "cpf",            precision: 11, null: false
    t.integer "id_funcionario",                null: false
    t.integer "id_professor",                  null: false
    t.integer "id_projetoex",                  null: false
  end

  add_index "participa", ["cpf"], name: "fkpar_alu_ind", using: :btree
  add_index "participa", ["id_funcionario"], name: "fkpar_fun_ind", using: :btree
  add_index "participa", ["id_professor"], name: "fkpar_pro_ind", using: :btree

  create_table "patrimonios", primary_key: "id_patrimonio", force: :cascade do |t|
    t.string  "localizacao",     limit: 30, null: false
    t.float   "valor",                      null: false
    t.date    "data_aquisicao",             null: false
    t.integer "id_departamento"
  end

  add_index "patrimonios", ["id_departamento"], name: "fkadministra2_ind", using: :btree

  create_table "pesquisa", id: false, force: :cascade do |t|
    t.integer "id_professor", null: false
    t.integer "id_area",      null: false
  end

  add_index "pesquisa", ["id_professor"], name: "fkpes_pro_ind", using: :btree

  create_table "pre_requisito", id: false, force: :cascade do |t|
    t.integer "pre_requisito", null: false
    t.integer "id_disciplina", null: false
  end

  add_index "pre_requisito", ["id_disciplina"], name: "fkpre_dis_ind", using: :btree

  create_table "professor", primary_key: "id_professor", force: :cascade do |t|
    t.integer "id_bolsa"
    t.string  "subdivisao_carreira", limit: 30,               null: false
    t.string  "nivel",               limit: 1,                null: false
    t.decimal "num_advertencias",               precision: 1, null: false
    t.integer "id_contrato",                                  null: false
  end

  add_index "professor", ["id_bolsa"], name: "fkrecebe2_id", unique: true, using: :btree

  create_table "projeto_extensao", primary_key: "id_projetoex", force: :cascade do |t|
    t.string "nome_projeto",          limit: 30, null: false
    t.string "entidade_financiadora", limit: 30, null: false
    t.string "tipo_projeto",          limit: 30, null: false
  end

  create_table "projeto_pesquisa", primary_key: "id_projeto", force: :cascade do |t|
    t.string  "nome_projeto", limit: 30, null: false
    t.integer "id_professor",            null: false
  end

  add_index "projeto_pesquisa", ["id_professor"], name: "fkorienta_ind", using: :btree

  create_table "registro", primary_key: "cpf", force: :cascade do |t|
    t.string "nome",       limit: 50, null: false
    t.string "rg",         limit: 9,  null: false
    t.date   "nascimento",            null: false
    t.string "sexo",       limit: 1,  null: false
  end

  create_table "turma_grad", primary_key: "id_turma", force: :cascade do |t|
    t.decimal "primeira_avaliacao",           precision: 2,  null: false
    t.decimal "segunda_avaliacao",            precision: 2,  null: false
    t.decimal "nota_recuperacao",             precision: 2,  null: false
    t.decimal "faltas",                       precision: 2,  null: false
    t.string  "aprovado",           limit: 1,                null: false
    t.integer "id_disciplina",                               null: false
    t.integer "id_professor",                                null: false
    t.decimal "cpf",                          precision: 11, null: false
  end

  add_index "turma_grad", ["cpf"], name: "fkfrequenta_ind", using: :btree
  add_index "turma_grad", ["id_disciplina"], name: "fktem_ind", using: :btree
  add_index "turma_grad", ["id_professor"], name: "fkministra_ind", using: :btree

  create_table "turma_pos", primary_key: "id_turmapos", force: :cascade do |t|
    t.decimal "primeira_avaliacao",           precision: 2,  null: false
    t.decimal "segunda_avaliacao",            precision: 2,  null: false
    t.decimal "nota_recuperacao",             precision: 2,  null: false
    t.decimal "faltas",                       precision: 2,  null: false
    t.string  "aprovado",           limit: 1,                null: false
    t.integer "id_discpos",                                  null: false
    t.integer "id_professor",                                null: false
    t.decimal "cpf",                          precision: 11, null: false
  end

  add_index "turma_pos", ["cpf"], name: "fkfrequenta2_ind", using: :btree
  add_index "turma_pos", ["id_discpos"], name: "fkpossui_ind", using: :btree
  add_index "turma_pos", ["id_professor"], name: "fkensina_ind", using: :btree

  add_foreign_key "aluno_graduacao", "aluno", column: "cpf", primary_key: "cpf", name: "fkalu_alu_1_fk"
  add_foreign_key "aluno_graduacao", "curso_graduacao", column: "id_curso", primary_key: "id_cgrad", name: "aluno_graduacao_id_curso_fkey"
  add_foreign_key "aluno_pos", "aluno", column: "cpf", primary_key: "cpf", name: "fkalu_alu_fk"
  add_foreign_key "aluno_pos", "bolsas", column: "id_bolsa", primary_key: "id_bolsa", name: "fkrecebe_fk"
  add_foreign_key "aluno_pos", "curso_pos", column: "id_curso", primary_key: "id_cpos", name: "aluno_pos_id_curso_fkey"
  add_foreign_key "aluno_pos", "projeto_pesquisa", column: "id_projeto", primary_key: "id_projeto", name: "fkassociado_fk"
  add_foreign_key "artigos_cientificos", "projeto_pesquisa", column: "id_projeto", primary_key: "id_projeto", name: "fkproduz_fk"
  add_foreign_key "biblioteca", "departamento", column: "id_departamento", primary_key: "id_departamento", name: "fkcoordena2_fk"
  add_foreign_key "bolsas", "projeto_pesquisa", column: "id_projeto", primary_key: "id_projeto", name: "fkgera_fk"
  add_foreign_key "cadastro", "aluno", column: "cpf", primary_key: "cpf", name: "fkdispoe_fk"
  add_foreign_key "contratos", "departamento", column: "id_departamento", primary_key: "id_departamento", name: "contratos_id_departamento_fkey"
  add_foreign_key "contratos", "registro", column: "id_registro", primary_key: "cpf", name: "contratos_id_registro_fkey"
  add_foreign_key "curso_graduacao", "departamento", column: "id_departamento", primary_key: "id_departamento", name: "fkadministra_fk"
  add_foreign_key "curso_pos", "departamento", column: "id_departamento", primary_key: "id_departamento", name: "fkgere_fk"
  add_foreign_key "disciplina_graduacao", "curso_graduacao", column: "id_cgrad", primary_key: "id_cgrad", name: "fkcompoe_fk"
  add_foreign_key "disciplina_pos", "curso_pos", column: "id_cpos", primary_key: "id_cpos", name: "fkcomposto_fk"
  add_foreign_key "emprestimo", "cadastro", column: "id_cadastro", primary_key: "id_cadastro", name: "fkefetua_fk"
  add_foreign_key "emprestimo", "exemplar", column: "id_exemplar", primary_key: "id_exemplar", name: "emprestimo_id_exemplar_fkey"
  add_foreign_key "engloba", "areas_de_pesquisa", column: "id_area", primary_key: "id_area", name: "fkeng_are_fk"
  add_foreign_key "engloba", "projeto_pesquisa", column: "id_projeto", primary_key: "id_projeto", name: "fkeng_pro"
  add_foreign_key "exemplar", "biblioteca", column: "id_biblioteca", primary_key: "id_biblioteca", name: "fkcontem_fk"
  add_foreign_key "exemplar", "livro", column: "id_livro", primary_key: "id_livro", name: "fktem2_fk"
  add_foreign_key "funcionario", "contratos", column: "id_contrato", primary_key: "id_contrato", name: "funcionario_id_contrato_fkey"
  add_foreign_key "participa", "aluno", column: "cpf", primary_key: "cpf", name: "fkpar_alu_fk"
  add_foreign_key "participa", "funcionario", column: "id_funcionario", primary_key: "id_funcionario", name: "fkpar_fun_fk"
  add_foreign_key "participa", "professor", column: "id_professor", primary_key: "id_professor", name: "fkpar_pro_fk"
  add_foreign_key "participa", "projeto_extensao", column: "id_projetoex", primary_key: "id_projetoex", name: "fkpar_pro_1"
  add_foreign_key "patrimonios", "departamento", column: "id_departamento", primary_key: "id_departamento", name: "fkadministra2_fk"
  add_foreign_key "pesquisa", "areas_de_pesquisa", column: "id_area", primary_key: "id_area", name: "fkpes_are"
  add_foreign_key "pesquisa", "professor", column: "id_professor", primary_key: "id_professor", name: "fkpes_pro_fk"
  add_foreign_key "pre_requisito", "disciplina_graduacao", column: "id_disciplina", primary_key: "id_disciplina", name: "fkpre_dis_fk"
  add_foreign_key "pre_requisito", "disciplina_graduacao", column: "pre_requisito", primary_key: "id_disciplina", name: "fkdisciplina_graduacao_1"
  add_foreign_key "professor", "bolsas", column: "id_bolsa", primary_key: "id_bolsa", name: "fkrecebe2_fk"
  add_foreign_key "professor", "contratos", column: "id_contrato", primary_key: "id_contrato", name: "professor_id_contrato_fkey"
  add_foreign_key "projeto_pesquisa", "professor", column: "id_professor", primary_key: "id_professor", name: "fkorienta_fk"
  add_foreign_key "turma_grad", "aluno_graduacao", column: "cpf", primary_key: "cpf", name: "fkfrequenta_fk"
  add_foreign_key "turma_grad", "disciplina_graduacao", column: "id_disciplina", primary_key: "id_disciplina", name: "fktem_fk"
  add_foreign_key "turma_grad", "professor", column: "id_professor", primary_key: "id_professor", name: "fkministra_fk"
  add_foreign_key "turma_pos", "aluno_pos", column: "cpf", primary_key: "cpf", name: "fkfrequenta2_fk"
  add_foreign_key "turma_pos", "disciplina_pos", column: "id_discpos", primary_key: "id_discpos", name: "fkpossui_fk"
  add_foreign_key "turma_pos", "professor", column: "id_professor", primary_key: "id_professor", name: "fkensina_fk"
end
