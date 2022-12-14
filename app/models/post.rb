class Post < ApplicationRecord
  has_rich_text :body
  has_many :comments
  validates :title, presence: true, length: { minimum: 5 }
end
