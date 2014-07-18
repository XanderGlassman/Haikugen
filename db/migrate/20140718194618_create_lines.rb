class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :poem_id
      t.string :body

      t.timestamps
    end
  end
end
