class CreateTableCandidateEvent < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :event
end
