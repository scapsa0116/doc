class Document < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :distribuidor
      t.string :responsavel
      t.date :data
      t.integer :user_id

      t.timestamps
    end
    add_index :documents, :user_id
  end
end
