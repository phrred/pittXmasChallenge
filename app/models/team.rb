class Team < ApplicationRecord
	
	def members
		User.where("team_id = ?", self.id)
	end
end
