class QuestionsController < ApplicationController
#before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_course, except:[:create]
  def index
    @questions = @course.questions
  end

  def show
    question_id = params[:question_id]
    @question = Question.find(question_id)
    #course_id = params[:course_id]
    #@course = @question.course

    @comments = [@question] + @question.comments

    @comment = Comment.new
    render :show
  end

  def new
    @question = Question.new
    @question.course_id = params[:course_id]
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    @question.course_id = params[:course_id]
    if @question.valid?
      @question.save
      redirect_to course_questions_path(@question.course_id)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @question.update?
      @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    render :index
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end

    def set_course
      @user = User.find(session[:user_id])
      course_id = params[:course_id]
      @course = Course.find(course_id)
    end
end
