class Post < ApplicationRecord
  #belongs_to :user
  #belongs_to :cat
  has_one_attached :image
end
