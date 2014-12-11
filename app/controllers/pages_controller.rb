class PagesController < ApplicationController
	before_action :authenticate_user!
	def new
		@page = current_user.pages.build
	end
	def index
		@pages = Page.all
	end
	def create
  		@page = current_user.pages.build(page_params)
 
  		respond_to do |format|
      		if @page.save
        		format.html { redirect_to @page, notice: 'Page was successfully created.' }
        		format.json { render :show, status: :created, location: @page }
      		else
       			format.html { render :new }
        		format.json { render json: @page.errors, status: :unprocessable_entity }
      		end
     	 end
	end
 

	def show
		@page = Page.find(params[:id])
		#@comments = Comment.where(page_id: @page)
	end

	private
  		def page_params
    		params.require(:page).permit(:title, :text, :image)
  		end
end
