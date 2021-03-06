class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :games
  has_and_belongs_to_many :outcomes

  def slug
    slug = self.name.strip.downcase.gsub(/[\&\$\+\,\/\:\;\=\?\@\#\s\<\>\[\]\{\}\|\~\^|\%\(\)\*]/, "-").gsub(/\-{2,}/, "-")
  end

  def self.find_by_slug(slug)
    self.all.each do |object|
      name = object.slug
      if name == slug
        return object
      end
    end
  end
  
end