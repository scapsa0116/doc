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
        @documents = @user.documents
     else
       @error = "That user doesn't exist" if params[:user_id]
       @documents = Document.all
     end
    end



    






   def create
    @document = Document.new(document_params)
    @document.user = current_user
  #  binding.pry
    if @document.save
    redirect_to documents_path
    else
     render :new
    end
end 

# @child = Child.new child_params
# @child.user = current_user
# @child.save

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

def document_params
    params.require(:document).permit(:distribuidor, :responsavel, :data, :created_at)
end



end