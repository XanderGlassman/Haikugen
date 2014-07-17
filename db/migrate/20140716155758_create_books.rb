class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :path

      t.timestamps
    end
  end
end
