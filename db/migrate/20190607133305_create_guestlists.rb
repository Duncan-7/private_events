class CreateGuestlists < ActiveRecord::Migration[5.2]
  def change
    create_table :guestlists do |t|
      t.references :attendee, references: :users, foreign_key: { to_table: :users }
      t.references :attended_event, references: :events, foreign_key: { to_table: :events }
      t.timestamps
    end
  end
end
