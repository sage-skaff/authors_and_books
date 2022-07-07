class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.boolean :series
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
