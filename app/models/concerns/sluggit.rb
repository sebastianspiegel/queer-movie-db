class Sluggit 
    def slug
        slug = self.name.downcase.split(" ")
        slug.join("-")

    end

    def self.find_by_slug(slug)
        self.all.find{|t| t.slug == slug}
    end
end
