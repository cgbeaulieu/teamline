class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :created_at
  default_scope order('created_at DESC')
end
