class GridsController < ApplicationController
  
  def new
    @survey = Survey.find(params[:survey_id])
    @grid = Grid.new
  end

  def create
    @row = ''
    params.each do | k , v |
      unless ['utf8','authenticity_token','survey_id','grid_x'].include? k then
        v == "" ? v = 0 : v = v.to_s
        if k.split("|")[1].to_i < params[:grid_x].to_i
          @row << v.to_s+","
        else
          @row << v.to_s
          @grid = Grid.new({"row"=>@row,"rownumber"=>params[:grid_x],"survey_id"=>params[:survey_id]})
          @grid.save
          @row = ''
        end         
      end  
    end
    redirect_to survey_path(params[:survey_id])     
  end   
  
  def edit
    @survey = Survey.find(params[:survey_id])
    @grid = Grid.find_all_by_survey_id(params[:survey_id])
  end
  
  def update
    Grid.where(:survey_id => params[:survey_id]).destroy_all
    @row = ''
    params.each do | k , v |
      unless ['utf8','authenticity_token','_method','action','controller','survey_id','grid_x','id'].include? k then
        v == "" ? v = 0 : v = v.to_s
        if k.split("|")[1].to_i < params[:grid_x].to_i
          @row << v.to_s+","
        else
          @row << v.to_s
          @grid = Grid.new({"row"=>@row,"rownumber"=>params[:grid_x],"survey_id"=>params[:survey_id]})
          @grid.save
          @row = ''
        end         
      end
    end
    redirect_to survey_path(params[:survey_id]) 
  end

  private
  
  def grids_params
    params.require(:grid).permit(:id,:survey_id,:row,:rownumbers)
  end
   
end
