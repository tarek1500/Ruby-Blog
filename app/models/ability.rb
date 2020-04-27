class Ability
	include CanCan::Ability

	def initialize(user)
		if user.present?
			can :read, Article, user_id: user.id
		end
	end
end