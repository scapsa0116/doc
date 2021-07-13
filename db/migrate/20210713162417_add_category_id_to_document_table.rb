class AddCategoryIdToDocumentTable < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :category_id, :integer
  end
end
