class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end
	def new
		@tag = Tag.new
	end
	def create
		Tag.create tag_params
		redirect_to tags_path
	end
	def tag_params
		params.require(:tag).permit(:name)
	end
	def show
		@tag=Tag.find params[:id]
	end
	def destroy
		t = Tag.find(params[:id])
		if t.creatures.length == 0
			t.destroy
			redirect_to tags_path
		else
		redirect_to tags_path
		end
	end
	def edit
    @tag = Tag.find params[:id]
	end

	def update
	    t = Tag.find params[:id]
	    t.update tag_params
	    redirect_to tags_path
	end


end
