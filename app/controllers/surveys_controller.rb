class SurveysController < ApplicationController

  def index
     @user = User.find(session[:user_id])
     @surveys = @user.survey
  end  
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  def new
    @survey = Survey.new
  end
  
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey
    else
      render 'new'
    end    
  end 
  
  def edit
    @survey = Survey.find(params[:id])
  end  
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to surveys_path
    else
      render 'edit'
    end          
  end     

  private
  
  def survey_params
    params.require(:survey).permit(:id,:user_id,:site,:date,:surveyors,:gridx,:gridy)
  end
    
end
