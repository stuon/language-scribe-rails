class DocumentsController < ApplicationController

    before_action :set_document, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @documents = Document.paginate(page: params[:page], per_page: 5)
    end

    def new
        @document = Document.new
    end

    def edit
    end

    def create
        @document = Document.new(document_params)
        @document.user = current_user
        if @document.save
            flash[:success] = "Document was successfully created"
            redirect_to document_path(@document)
        else
            render 'new'
        end
    end

    def update
        if @document.update(document_params)
            flash[:success] = "Document was successfully updated"
            redirect_to document_path(@document)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @document.destroy
        flash[:danger] = "Document was successfully deleted"
        redirect_to documents_path
    end

    private
    
    def set_document
        @document = Document.find(params[:id])
    end

    def document_params
        params.require(:document).permit(:title, :content, :library_id)
    end

    def require_same_user
        if current_user != @document.user and !current_user.admin?
            flash[:danger] = "You can only edit or delete your own documents"
            redirect_to documents_path
        end
    end
end
