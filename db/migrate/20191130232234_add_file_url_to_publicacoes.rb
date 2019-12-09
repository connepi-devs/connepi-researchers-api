class AddFileUrlToPublicacoes < ActiveRecord::Migration[5.2]
  def change
    add_column :publicacoes, :file_url, :string
  end
end
