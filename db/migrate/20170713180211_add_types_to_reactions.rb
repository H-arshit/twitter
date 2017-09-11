class AddTypesToReactions < ActiveRecord::Migration
  def change
      add_column :reactions, :types, :fixnum
  end
end
