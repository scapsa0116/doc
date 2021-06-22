class DocumentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @document = @user.documents.build
        else
        @document = Document.new
        end
        # @document.build_category 
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @documents = @user.documents.alpha
     else
       @error = "That user doesn't exist" if params[:user_id]
    #    @documents = Job.alpha.includes(:category, :user)
     end
 
    #  @jobs = @jobs.search(params[:q].downcase) if params[:q] && !params[:q].empty?
    #  @jobs = @jobs.filter(params[:job][:category_id]) if params[:job] && params[:job][:category_id] != ""
 
   end


   def create
    @document = current_user.documents.build(document_params)
    #binding.pry
    if @document.save
    redirect_to documents_path
    else
     render :new
    end
end 


def edit
    @document = Document.find_by_id(params[:id])
    redirect_to documents_path if !@document || @document.user != current_user
    # @document.build_category if !@job.category
  end

  def update
     @document = Document.find_by_id(id: params[:id])
     redirect_to documents_path if !@document || @document.user != current_user
    if @document.update(document_params)
      redirect_to document_path(@document)
    else
      render :edit
    end
  end



  def show 
        
    @document = Document.find_by_id(params[:id])
    redirect_to documents_path if !@document
end

private

def job_params
    params.require(:document).permit(:first_name, :last_name, :phone_number, :busness_email, :title, :description, :category_id, :category_attributes)
end



end