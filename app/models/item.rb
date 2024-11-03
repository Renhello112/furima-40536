class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
