class Post < ActiveRecord::Base
  attr_accessible :title, :content, :tag_list
  acts_as_textile :content
  acts_as_taggable

  def self.search(search)
    if search
      where({:content.matches => "%#{search}%"} | {:title.matches => "%#{search}%"})
    else
      scoped
    end
  end
end
