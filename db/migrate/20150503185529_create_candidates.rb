class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :last_name
      t.string :cellphone
      t.belongs_to :account, index: true
      t.string :carreer1
      t.string :carreer2
      t.string :carreer3

      t.timestamps
    end
  end
end
