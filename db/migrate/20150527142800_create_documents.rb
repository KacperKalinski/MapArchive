class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :short_description

      t.column :attachment, :oid, :null => false
      t.timestamps null: false
    end
  end
end
