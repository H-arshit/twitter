class ReactionsController < ApplicationController
	before_action :authenticate_user!


	def toggle_reaction

		
		@tweet = Tweet.find(params[:tweet_id])

		@reaction_code = params[:reaction_code].to_i

		@love = false
		@like = false
		@angry = false

		if @reaction_code == 1.to_i

			@like = true

		elsif @reaction_code == 2.to_i
			
			@love = true

		else
			
			@angry = true
			
		end



		# if reaction_code > 3 || reaction_code < 0
  #   		  reaction_code = 1
  #   	end

		react = Reaction.where(user: current_user, tweet: @tweet).first

		if !react
			
			Reaction.create(user: current_user, tweet: @tweet, types: @reaction_code)




		elsif react.types == @reaction_code
		 	 
		 	 react.destroy!

		@love = false
		@like = false
		@angry = false

		else

			react.types = @reaction_code;

			react.save

		end

		respond_to do |format|
			format.js {}
		end
		
	end

end
