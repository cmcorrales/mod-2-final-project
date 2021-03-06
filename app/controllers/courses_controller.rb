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
    if !@user.isTeacher
      redirect_to courses_path
    else
      @course = Course.new
      @teachers = User.all.select do |user|
        user.isTeacher
      end
      render :new
    end
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      CourseSelection.create(course_id: @course.id, user_id: @course.teacher_id)
      redirect_to courses_path
    else
      @teachers = User.all.select do |user|
        user.isTeacher
      end
      @user = User.find(session[:user_id])
      @cur_model = @course
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
    if @course.course_selections.size >= @course.max_number
      flash[:notice] = "Over max number in this course, you can't choose it."
      redirect_to courses_path
    else
      cs = CourseSelection.create(user_id: user_id, course_id: @course.id)
      redirect_to courses_path
    end

  end
  private

  def course_params
    params.require(:course).permit(:name, :teacher_id, :desc, :begin_date, :end_date, :max_number)
  end
end
