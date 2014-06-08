class GridsController < ApplicationController
  
  def new
    @survey = Survey.find(params[:survey_id])
    @grid = Grid.new
  end

  def create
    @row = ''
    @rownumber = 0
    params.each do |k,v|
      unless ['utf8','authenticity_token','survey_id','grid_x'].include? k then
        v == "" ? v = 0 : v = v.to_s
        if k.split("|")[1].to_i < params[:grid_x].to_i
          @row << v.to_s+","
        else
          @row << v.to_s
          @grid = Grid.new({"row"=>@row,"rownumber"=>@rownumber+=1,"survey_id"=>params[:survey_id]})
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
    @grid.sort! {|a,b| a.rownumber<=>b.rownumber}
  end
  
  def update
    @hash = {}
    @cols = []
    params.each do |k,v|
      if k.include? "|"
        @cols << k.split("|")[1].to_i
      end 
      v == "" ? v = 0 : v = v.to_s
    end
    @cols.max()
    @rownumber = 0
    @row = ''
    params.each do |k,v|
      if k.include? "|"
        if k.split("|")[1].to_i < @cols.max()
          @row << v.to_s+","
        else
          @row << v.to_s
          @rownumber += 1
          @grid = Grid.find_by_id(k.split("|")[0])
          @grid.row = @row
          @grid.rownumber = @rownumber
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
