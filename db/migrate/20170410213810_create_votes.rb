class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.string :direction

      t.timestamps null: false
    end
  end
end
