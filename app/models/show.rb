class Show < ActiveRecord::Base
    belongs_to :user

    def slug
        slug = self.username.downcase.split(" ")
        slug.join("-")
    end
    
    def self.find_by_slug(slug)
        Show.all.find{|show| show.slug == slug}
    end

end