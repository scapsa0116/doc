class AddColumnsToThetableDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :visao, :string
    add_column :documents, :missao, :string
    add_column :documents, :codico, :string
    add_column :documents, :snpj, :string
    add_column :documents, :endereco, :string
    add_column :documents, :email, :string
    add_column :documents, :matriz, :string
    add_column :documents, :filial, :string
    add_column :documents, :filiall, :string
  end
end