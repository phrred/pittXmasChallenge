class Comment < ApplicationRecord
	self.per_page = 15

	belongs_to :mission
    belongs_to :user

	validates :user, presence: true
    validates :content, presence: true


	has_attached_file :avatar, styles: { medium: "100x100>", thumb: "100x100>" },
	:url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

    has_attached_file :video, styles: {:thumb => ["100x100>", :jpg]},
    :processors => [:transcoder],
    :url  => ":s3_domain_url",
    :path => "public/videos/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/

    
    def is_type_of_video?
        avatar.content_type =~ %r(video)
    end

    def is_type_of_image?
        avatar.content_type =~ %r(image)
    end
end
