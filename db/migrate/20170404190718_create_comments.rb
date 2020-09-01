class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
