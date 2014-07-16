class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :poem_type
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
