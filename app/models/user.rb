class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  validates :user_name, uniqueness: true, presence: true, length: { maximum: 255 }

  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :course_selections
  has_many :courses, through: :course_selections

  def isTeacher
    self.user_type == "T"
  end
end
