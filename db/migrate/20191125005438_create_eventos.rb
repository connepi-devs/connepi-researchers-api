class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.string :name
      t.string :state
      t.integer :year

      t.timestamps
    end
  end
end
