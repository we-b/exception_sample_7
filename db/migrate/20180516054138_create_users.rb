class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :ticket_count
      t.timestamps
    end
  end
end
