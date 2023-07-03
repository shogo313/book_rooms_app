class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :number_of_people
      t.integer :number_of_nights
      t.integer :payment_amount
      t.bigint :user_id
      t.bigint :room_id

      t.timestamps
    end
  end
end
