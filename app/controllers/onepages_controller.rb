class OnePageController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @onepage = @user.onepages.build
        else
        @onepage = Onepage.new
        end
        # @document.build_category 
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @onepages = @user.onepages
     else
       @error = "That user doesn't exist" if params[:user_id]
       @onepages = Onepage.all
     end
    end

 def create
    @onepage = Onepage.new(onepage_params)
    @onepage.user = current_user
  #  binding.pry
    if @onepage.save
    redirect_to onepages_path
    else
     render :new
    end
end 

# @child = Child.new child_params
# @child.user = current_user
# @child.save

def edit
    @onepage = Onepage.find_by_id(params[:id])
    redirect_to onepages_path if !@onepage || @onepage.user != current_user
    # @document.build_category if !@job.category
  end

  def update
     @onepage = Onepage.find_by_id(id: params[:id])
     redirect_to onepages_path if !@onepage || @onepage.user != current_user
    if @onepage.update(document_params)
      redirect_to onepage_path(@onepage)
    else
      render :edit
    end
  end



  def show 
        
    @onepage = Onepage.find_by_id(params[:id])
    redirect_to onepages_path if !@onepage
end

private

def onepage_params
    params.require(:onepage).permit(:visaor, :missao)
end



end