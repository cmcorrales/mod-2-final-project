class Course < ApplicationRecord
  belongs_to :teacher, class_name: :User
  validates :max_number, inclusion: 1..50
  has_many :course_selections
  has_many :users, through: :course_selections
  has_many :questions
end
