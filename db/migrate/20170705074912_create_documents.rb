class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents, options: "ENGINE=Mroonga" do |t|
      t.text :title
      t.text :content

      t.timestamps
    end

    add_index :documents, :content, type: :fulltext
  end
end
