class Tweet < ActiveRecord::Base
  belongs_to :user
    validates :content, presence: true, length: {maximum: 140}




   def reacted_by (user_id , reaction_code)
  	Reaction.where(tweet_id: id, user_id: user_id, types: reaction_code).length > 0
  end


  def react_string (user_id , reaction_code)

  	if reacted_by(user_id ,reaction_code)
  		return "2"
  	else
  		return "1"
  	end

  end




end
