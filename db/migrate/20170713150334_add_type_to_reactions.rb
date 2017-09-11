class AddTypeToReactions < ActiveRecord::Migration
  def change
    add_column :reactions, :type, :integer
  end
end
