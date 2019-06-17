class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def comment_author_name
    user.full_name
  end
end
