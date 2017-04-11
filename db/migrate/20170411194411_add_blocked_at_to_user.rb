class AddBlockedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :blocked_at, :datetime
  end
end
