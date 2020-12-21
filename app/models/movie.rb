class Movie < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    validates :title, uniqueness: true, presence: true
    validates :genre, presence: true
    validates :year, presence: true
    validates :summary, presence: true


    def slug
        slug = self.username.downcase.split(" ")
        slug.join("-")
    end
    
    def self.find_by_slug(slug)
        Movie.all.find{|show| show.slug == slug}
    end

end