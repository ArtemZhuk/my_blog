class Comment < ActiveRecord::Base
  belongs_to :comments
  belongs_to :article
  belongs_to :user
end
