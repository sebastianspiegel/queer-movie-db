class User < ActiveRecord::Base
    has_many :shows 
    has_secure_password
    validates #active record validation

    def slug
        slug = self.username.downcase.split(" ")
        slug.join("-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end

end