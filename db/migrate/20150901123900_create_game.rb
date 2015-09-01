class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :done, default: false, null: false
      t.float :time
      t.integer :winner
    end
  end
end
