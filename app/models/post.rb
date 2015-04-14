class Post < ActiveRecord::Base

	validates :status, uniqueness: true

	belongs_to :user

	def scheduled_date=(date)
		time = DateTime.civil(date[:year].to_i, date[:month].to_i, date[:day].to_i, date[:hour].to_i)
		self.scheduled_at = time
	end

	def self.scheduled_now
		where scheduled_at: Time.now.beginning_of_hour
	end

end
