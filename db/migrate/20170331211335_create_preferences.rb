class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.string :company
      t.string :email_from
      t.boolean :default, :null => false, :default => false

      t.timestamps null: false
    end
  end
end
