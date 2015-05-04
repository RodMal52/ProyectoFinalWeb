class Candidate < ActiveRecord::Base
  belongs_to :account
  has_many :create_table_candidate_events
end
