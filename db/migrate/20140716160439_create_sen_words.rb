class CreateSenWords < ActiveRecord::Migration
  def change
    create_table :sen_words do |t|
      t.integer :word_id
      t.integer :sentence_id

      t.timestamps
    end
  end
end
