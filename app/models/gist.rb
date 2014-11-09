class Gist < ActiveRecord::Base
  validates :content, presence: true

  scope :opened, -> { where(private: false) }
  scope :closed, -> { where(private: true) }

  belongs_to :user
  has_many :comments
end
