class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :item
  belongs_to :user 
end
