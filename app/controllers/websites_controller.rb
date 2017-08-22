class WebsitesController < ApplicationController

    before_action :set_website, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @websites = Website.paginate(page: params[:page], per_page: 5)
    end

    def new
        @website = Website.new
    end

    def edit
    end

    def create
        @website = Website.new(website_params)
        @website.user = current_user

        baseurl = URI.parse(@website.url)
        hosturl = baseurl.host
        source = Source.find_by url:hosturl
        if @search.blank?
            source = Source.new
            source.title = hosturl
            source.url = hosturl
            source.save
        end

        @website.source = source

        if @website.save
            flash[:success] = "Website was successfully created"
            redirect_to website_path(@website)
        else
            render 'new'
        end
    end

    def update
        if @website.update(website_params)
            flash[:success] = "Website was successfully updated"
            redirect_to website_path(@website)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @website.destroy
        flash[:danger] = "Website was successfully deleted"
        redirect_to websites_path
    end

    private
    
    def set_website
        @website = Website.find(params[:id])
    end

    def website_params
        params.require(:website).permit(:url, :title, :note, :library_id, :source_id)
    end

    def require_same_user
        if current_user != @website.user and !current_user.admin?
            flash[:danger] = "You can only edit or delete your own websites"
            redirect_to websites_path
        end
    end
end
