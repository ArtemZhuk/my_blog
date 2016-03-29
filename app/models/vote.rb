class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  belongs_to :article

  validates :user_id, uniqueness: { scope: :article_id}
end


