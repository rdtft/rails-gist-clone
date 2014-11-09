class Comment < ActiveRecord::Base
  belongs_to :gist
  belongs_to :user

  validates :body, presence: true
end
