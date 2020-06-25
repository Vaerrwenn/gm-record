class CetyasController < ApplicationController
    def index
        @cetyas = Cetya.all
    end
    
    def new
        @cetya = Cetya.new
    end
    
    def create
        @cetya = Cetya.new(cetya_params)
        if @cetya.save
          redirect_to cetyas_path
        else
          render 'new'
        end
    end

    def show
        @cetya = Cetya.find(params[:id])
    end

    def edit
        @cetya = Cetya.find(params[:id])
    end
    
    def update
        @cetya = Cetya.find(params[:id])
        if @cetya.update_attributes(cetya_params)
          redirect_to cetyas_path
        else
          render 'edit'
        end
    end
    
    def destroy
        @cetya = Cetya.find(params[:id])
        if @cetya.destroy
            redirect_to cetyas_url
        else
            redirect_to cetyas_url
        end
    end
    
    private

    def cetya_params
        params.require(:cetya).permit(:cetya_name)
    end
end
