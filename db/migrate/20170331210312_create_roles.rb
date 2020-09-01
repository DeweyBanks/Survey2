class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name,              null: false, default: ""

      t.timestamps null: false
    end

    add_index :roles, :name,                unique: true
  end
end
