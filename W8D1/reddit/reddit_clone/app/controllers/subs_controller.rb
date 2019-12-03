class SubsController < ApplicationController
  before_action :require_current_user
  def new
    @sub=Sub.new
    render :new 
  end     

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id=current_user.id     

    if @sub.save    
      redirect_to sub_url(@sub)
    else      
      flash.now[:errors]=@sub.errors.full_messages 
      render :new 
    end    
  end    

  def index 
    @subs=Sub.all 
    render :index 
  end     

  def show
    @sub = Sub.find(params[:id])
    render :show 
  end   
   

  def edit  
    @sub= Sub.find(params[:id])
    if current_user.id == @sub.moderator_id
      render :edit 
    else
      flash[:errors]=['Only a moderator can edit the sub']
      redirect_to sub_url(@sub) 
    end
  end     

  def update   
    @sub=Sub.find(params[:id]) 
    if @sub.update_attributes(sub_params) 
      redirect_to sub_url(@sub) 
    else 
      flash.now[:errors]=@sub.errors.full_messages 
      render :edit
    end           
  end   



  private 
  def sub_params
    params.require(:sub).permit(:title, :description)
  end 
end
