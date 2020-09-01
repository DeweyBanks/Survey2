class AddVotesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :up_vote, :integer, :null => false, :default => 0
    add_column :comments, :down_vote, :integer, :null => false, :default => 0
  end
end
