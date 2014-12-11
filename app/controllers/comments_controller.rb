class CommentsController < ApplicationController
  	before_action :set_page
  	before_action :authenticate_user!
	def new
		@comment = Comment.new
	end
	def create
    	@comment = Comment.new(comment_params)
    	@comment.user_id = current_user.id
    	@comment.page_id = @page.id

    	if @comment.save
      	redirect_to page_path(@page)
    	else
      	render 'new'
    	end
 	 end
 	private
   		def set_page
      		@page = Page.find(params[:page_id])
    	end

    	def comment_params
      		params.require(:comment).permit(:text)
    	end
end
