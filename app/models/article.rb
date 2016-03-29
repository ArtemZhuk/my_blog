class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, presence: true,
            length: { minimum: 5 }
  validates :text, presence: true,
            length: { minimum: 5 }
  validates :user_id, presence: true

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end
end


