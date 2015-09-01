class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false, unique: true
    end
  end
end
