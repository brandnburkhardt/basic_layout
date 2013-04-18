class Article < ActiveRecord::Base
  attr_accessible :author, :content, :title, :tag_list
  validates_presence_of :title, :content, :author

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end
end
