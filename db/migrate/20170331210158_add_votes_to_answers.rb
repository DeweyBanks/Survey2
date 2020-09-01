class AddVotesToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :votes, :integer, :null => false, :default => 0
  end
end
