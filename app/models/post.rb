class Post < ApplicationRecord
	serialize :tags
	validates :id,:author,:authorId,:likes,:popularity,:reads, presence: true
end
