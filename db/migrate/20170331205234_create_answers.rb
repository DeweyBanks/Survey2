class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
