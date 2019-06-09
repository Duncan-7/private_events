class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.references :creator, references: :users, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
