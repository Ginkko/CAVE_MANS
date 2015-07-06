class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :updated_at, :datetime
    add_column :users, :created_at, :datetime

  end
end
