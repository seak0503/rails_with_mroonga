class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts, options: 'ENGINE=Mroonga' do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end

    add_index :microposts, :content, type: :fulltext, comment: 'normalizer "NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark"'
  end
end
