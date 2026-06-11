class Post < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :cat_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
end