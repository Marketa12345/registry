class LeasableController < ApplicationController





 	def index

	@subjects = Subject.where(leasable:true).where(is_public2:true)


	end




end
