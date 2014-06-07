class SurveysController < ApplicationController

  def index
     if session[:user_id].nil?
       redirect_to login_path
     else
        @user = User.find(session[:user_id])
        @surveys = @user.survey  
     end 
  end  
  
  def show
    @survey = Survey.find(params[:id])
    unless @survey.grid.empty? then
      @debug = @survey.grid.order("rownumber")
      @array = []
      @survey.grid.each do |r|
        data = r.row.split(",")
        data.each do |d| @array << d end
      end
      @normalise = 255/@array.max.to_i
      @y = 30
    end  
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
