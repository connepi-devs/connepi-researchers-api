class UpdatePublicationAddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :publicacoes, :instituicoes, column: :instituicao_id
    add_foreign_key :publicacoes, :areas, column: :area_id
  end
end
