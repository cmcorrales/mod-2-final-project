class CoursesController < ApplicationController
  def index
    type = params[:type] || "1"
    @user = User.find(session[:user_id])
    @hash = {}
    @user.courses.each do |course|
      @hash[course.id] = course
    end
    if type == "1"    # All
      @courses = Course.all
    elsif type == "2"  # Selected
      @courses = @user.courses
    else   # Not Selected
      @courses = Course.all.select do |course|
        @hash[course.id] == nil
      end
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    if @user.user_type != "2"
      redirect_to courses_path
    else
      @course = Course.new
      @teachers = User.all.select do |user|
        user.user_type == "2"
      end
      render :new
    end
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      redirect_to courses_path
    else
      render :new
    end
  end


  def cancel
    user_id = session[:user_id]
    cs = CourseSelection.find_by(user_id: user_id, course_id: params[:id])
    cs.destroy
    redirect_to courses_path
  end

  def select
    @course = Course.find(params[:id])
    user_id = session[:user_id]
    cs = CourseSelection.create(user_id: user_id, course_id: @course.id)
    redirect_to courses_path
  end
  private

  def course_params
    params.require(:course).permit(:name, :teacher_id, :desc, :begin_date, :end_date, :max_number)
  end
end
