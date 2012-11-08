class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :created_at
  # scope => ('order by DESC')
end
