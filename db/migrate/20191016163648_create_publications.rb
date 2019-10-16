class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :publication
      t.string :author
      t.string :instituition
      t.string :status
      t.string :area
      t.int :year
    end
  end
end
