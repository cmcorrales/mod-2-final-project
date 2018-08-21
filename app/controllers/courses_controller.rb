class CoursesController < ApplicationController
  def index
    type = params[:type] || "1"

    @courses = Course.all
    @user = User.find(session[:user_id])
    @course_selections = @user.course_selections
  end

  def show
    @course = Course.find(params[:id])
  end

  def cancel
    user_id = Session[:user_id]
    CourseSelection.destroy(user_id:user_id, course_id: params[:id])
    redirect_to :index
  end

  def select
    @course = Course.find(params[:id])
    user_id = Session[:user_id]
    cs = CourseSelection.create(user_id: user_id, course_id: @course.id)
    redirect_to :index
  end

  def new

  end

  def create
    @course = Course.create(course_params)
  end

  private

  def course_params
    params.require(:course).permit(:name, :teacher_id, :desc, :begin_date, :end_date, :max_member)
  end
end
