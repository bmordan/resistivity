class SurveysController < ApplicationController

  def index
     if session[:user_id].nil?
       redirect_to login_path
     else
        @user = User.find(session[:user_id])
        @surveys = Survey.find_by user_id(2) 
     end 
  end  
  
  def show
    @survey = Survey.find(params[:id])
    unless @survey.grid.empty? then
      @array = []
      @sorted = @survey.grid.sort {|a,b| a.rownumber<=>b.rownumber}
      @sorted.each do |r|
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

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end  

  private
  
  def survey_params
    params.require(:survey).permit(:id,:user_id,:site,:date,:surveyors,:gridx,:gridy)
  end
    
end
