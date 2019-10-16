class CreateIntituicoes < ActiveRecord::Migration[5.1]
  def change
    create_table :intituicoes do |t|
      t.string :nome
      t.string :sigla
      t.string :regiao

      t.timestamps
    end
  end
end
