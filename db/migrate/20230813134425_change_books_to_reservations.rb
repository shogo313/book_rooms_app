class ChangeBooksToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_table :books, :reservations
  end
end
