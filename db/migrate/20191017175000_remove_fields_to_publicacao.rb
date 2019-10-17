class RemoveFieldsToPublicacao < ActiveRecord::Migration[5.1]
  def change
    remove_column :publicacoes, :instituicao, :string
    remove_column :publicacoes, :area, :string
  end
end
