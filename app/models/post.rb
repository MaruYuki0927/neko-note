class Post < ApplicationRecord
  #belongs_to :user
  #belongs_to :cat
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
end
