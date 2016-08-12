class IdeasController < ApplicationController
	def new
		@idea=Idea.new
	end

	def index
		@ideas = Idea.all
	end

	
	def show
		@idea = Idea.find(params[:id])
	end

	def create

		@idea=Idea.create(idea_params)
		if @idea.save
			redirect_to idea_path(@idea)
		else
			render :new
        end
	end
	
	def idea_params
		params.permit(:title, :description, :planned_to)
	end
	
	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update(idea_params)
			redirect_to idea_path(@idea)
		else
			render :edit
		end
	end

end
