class Post < ActiveRecord::Base

	validates :status, uniqueness: true

	belongs_to :user
end
