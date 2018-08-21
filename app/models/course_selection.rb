class CourseSelection < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates_uniqueness_of :course_id, scope: :user_id, msg: "Student can't select the same course"


end
