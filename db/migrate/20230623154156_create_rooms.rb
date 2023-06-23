class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :charge_per_night
      t.text :detail
      t.string :adress
      t.bigint :user_id

      t.timestamps
    end
  end
end
