class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def new
      @comment = comment.new
    end

    def create
      # is this what I use to redirect to the question show page so the user can see the newly added comment?
      question_id = params[:question_id]
      @question = Question.find(question_id)
      comments = @question.comments

      @comment = comment.new(comment_params)
      if @comment.valid?
        @comment.save
        # this is my attempt to get to the questions path :( it's probably wrong 
        redirect_to question_path(@question)
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
        params.require(:comment).permit(:question_id, :content, :user_id)
      end

      def set_comment
        @comment = comment.find(params[:id])
      end
  end

end
