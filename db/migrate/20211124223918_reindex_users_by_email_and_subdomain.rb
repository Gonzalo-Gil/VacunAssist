class ReindexUsersByEmailAndSubdomain < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, :email
    add_index :users, [:email, :dni], :unique => true
  end
  
  def down
    remove_index :users, [:email, :dni]
    add_index :users, :email, :unique => true
  end
end
