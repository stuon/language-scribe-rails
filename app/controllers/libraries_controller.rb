class LibrariesController < ApplicationController

    before_action :set_library, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @libraries = Library.paginate(page: params[:page], per_page: 5)
    end

    def new
        @library = Library.new
    end

    def edit
    end

    def create
        @library = Library.new(library_params)
        @library.user = current_user
        if @library.save
            flash[:success] = "Library was successfully created"
            redirect_to library_path(@library)
        else
            render 'new'
        end
    end

    def update
        if @library.update(library_params)
            flash[:success] = "Library was successfully updated"
            redirect_to library_path(@library)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @library.destroy
        flash[:danger] = "Library was successfully deleted"
        redirect_to libraries_path
    end

    private
    
    def set_library
        @library = Library.find(params[:id])
    end

    def library_params
        params.require(:library).permit(:name, :description)
    end

    def require_same_user
        if current_user != @library.user
            flash[:danger] = "You can only edit or delete your own libraries"
            redirect_to root_path
        end
    end
end
