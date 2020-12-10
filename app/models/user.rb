class User < ActiveRecord::Base
    has_many :movies 
    has_many :comments
    has_many :favorites
    #has_many :favorites, through: :user_favorites, source: :movie 
    has_secure_password
    validates :username, uniqueness: true, presence: true

    def slug
        slug = self.username.downcase.split(" ")
        slug.join("-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end

end