class CreatePublicacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :publicacoes do |t|
      t.string :publicacao
      t.string :autor
      t.string :instituicao
      t.string :status
      t.string :area
      t.integer :ano

      t.timestamps
    end
  end
end
