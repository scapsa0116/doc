class OnePages < ActiveRecord::Migration[6.1]
  def change
    create_table :onepages do |t|
      t.string :visao
      t.string :missao

      t.timestamps
    end

  end
end
