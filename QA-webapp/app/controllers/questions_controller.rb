class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(question_params) 
    
    if @question.save
      redirect_to questions_path
    else
      render "new"
    end
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
      
    redirect_to @question
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.delete
    
    redirect_to questions_path
  end
  
  # the objects needs these parameters in order to be saved to the DB
  # security will be added later
  private
    def question_params
      params.require(:question).permit(:title, :text)
    end
end
