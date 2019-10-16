class CreatePublicacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :publicacaos do |t|

      t.timestamps
    end
  end
end
