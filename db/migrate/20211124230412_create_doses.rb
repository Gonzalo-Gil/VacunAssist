class CreateDoses < ActiveRecord::Migration[6.1]
  def change
    create_table :doses do |t|
      t.integer :numeroDosis
      t.integer :dias

      t.timestamps
    end
  end
end
