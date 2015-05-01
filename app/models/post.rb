class Post < ActiveRecord::Base
  validates :content, length: { maximum: 141 }
  belongs_to :user
end
