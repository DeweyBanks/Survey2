class AddBlockedAtToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blocked_at, :datetime
  end
end
