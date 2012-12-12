module Teamable
  
  def team(team_id)
    self.joins(:person => :team).where('people.team_id = ?', team_id)
  end
end