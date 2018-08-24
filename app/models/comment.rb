class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def title
    
  end
end
