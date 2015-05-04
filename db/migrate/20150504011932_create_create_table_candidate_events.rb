class CreateCreateTableCandidateEvents < ActiveRecord::Migration
  def change
    create_table :create_table_candidate_events do |t|
      t.references :candidate, index: true
      t.belongs_to :event, index: true
      t.boolean :assistance

      t.timestamps
    end
  end
end
