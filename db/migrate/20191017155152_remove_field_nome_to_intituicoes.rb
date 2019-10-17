class RemoveFieldNomeToIntituicoes < ActiveRecord::Migration[5.1]
  def change
    remove_column :instituicoes, :nome, :string
  end
end
