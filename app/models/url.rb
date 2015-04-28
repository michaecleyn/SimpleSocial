class Url < ActiveRecord::Base
	belongs_to :user

	def self.scheduled_today
		dow = Time.now.strftime("%A").downcase.to_s
		query = {}
		query[dow] = true
		where query
	end
end
