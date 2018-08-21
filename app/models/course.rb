class Course < ApplicationRecord
  belongs_to :teacher, class_name: :User
  validates :max_member, inclusion: 1..50
end
