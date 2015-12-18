class SearchesController < ApplicationController

	def new 

		@search = Search.new
	end


	def create

		@search = Search.create!(params[:search])
		redirect_to @search
	end

	def show

		#@search = Search.find(params[:id])

    @subjects=@subject.where(is_public2: true)
  
	end

	def index
		@search = Subject.where(is_public2: true).ransack(params[:q])
		@subjects = @search.result
	end
end
