class Post < ActiveRecord::Base
	validates :status, uniqueness: true
	belongs_to :user

	def scheduled_date=(date)
		self.scheduled_at = date
	end

	def self.scheduled_now
		where scheduled_at: Time.now.beginning_of_hour
	end

	def time_now
    moment = Time.now.utc
    moment.localtime
  end
end
