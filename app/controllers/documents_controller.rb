class DocumentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @document = @user.documents.build
        else
        @document = Document.new
        end
        # binding.pry
         @document.build_category 
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        # @documents = @user.documents
        @documentss = @user.documentss.alpha
     else
       @error = "That user doesn't exist" if params[:user_id]
       @documents = Document.alpha.includes(:category, :user)
     end
    end


 def create
  @document = current_user.documents.build(document_params)
    # @document = Document.new(document_params)
    # @document.user = current_user
  # binding.pry
    if @document.save
    redirect_to documents_path
    else
     render :new
    end
end 


def edit
    @document = Document.find_by_id(params[:id])
    redirect_to documents_path if !@document || @document.user != current_user
    @document.build_category if !@job.category
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
    params.require(:document).permit(:distribuidor, :responsavel, :data, :created_at, :visao, :missao, :codico, :snpj, :endereco, :email, :matriz, :filial, :filiall, :category_id, :category_attributes)
end



end