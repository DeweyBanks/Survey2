class AddVotesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :votes, :integer, :null => false, :default => 0
  end
end
