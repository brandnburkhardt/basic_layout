class Article < ActiveRecord::Base
  attr_accessible :author, :content, :title

  validates_presence_of :title, :content, :author
end
