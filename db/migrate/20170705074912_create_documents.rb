class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents, comment: 'engine "InnoDB"', options: "ENGINE=Mroonga" do |t|
      t.text :title
      t.text :content

      t.timestamps
    end

    add_index :documents, :title, type: :fulltext, comment: 'normalizer "NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark"'
    add_index :documents, :content, type: :fulltext, comment: 'normalizer "NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark"'
  end
end
