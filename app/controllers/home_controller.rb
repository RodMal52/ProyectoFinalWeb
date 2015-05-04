class HomeController < ApplicationController
  def Index
  end
  def eventos
  	@events = Event.all
  	@create_table_candidate_event = CreateTableCandidateEvent.new
  end
end
