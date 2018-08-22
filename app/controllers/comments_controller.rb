class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def new
      @comment = comment.new
    end

    def create
      # is this what I use to redirect to the question show page so the user can see the newly added comment?
      question_id = params[:question_id]
      user_id = session[:user_id]
      @question = Question.find(question_id)
      course_id = @question.course_id

      @comment = Comment.new(content: comment_params[:content], user_id: user_id, question_id: question_id)
      if @comment.valid?
        @comment.save
        # this is my attempt to get to the questions path :( it's probably wrong
        redirect_to course_question_path(course_id, @question.id)
      else
        render :new
      end
    end

    def edit
      render :edit
    end

    def update
      if @comment.update?
        @comment.save
        redirect_to @comment
      else
        render :edit
      end
    end

    def destroy
      @comment.destroy
      render :index
    end

    private
      def comment_params
        params.require(:comment).permit(:content)
      end

      def set_comment
        @comment = comment.find(params[:id])
      end

end
