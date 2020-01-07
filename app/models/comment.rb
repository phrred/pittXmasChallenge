class Comment < ApplicationRecord
	self.per_page = 15

	belongs_to :mission
    belongs_to :user

	validates :user, presence: true
    validates :content, presence: true

    has_one_attached :avatar
    has_one_attached :video

    # WIP validation. Need to figure out error handling
    # validates :avatar, content_type: /\Aimage\/.*\z/
    # validates :video, content_type: /\Avideo\/.*\z/

end
