class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :content
      t.references :user, index: true

      t.timestamps
    end
    add_index :borads, :user_id
  end
end
