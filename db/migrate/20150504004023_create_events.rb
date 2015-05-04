class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.datetime :date

      t.timestamps
    end
  end
end
