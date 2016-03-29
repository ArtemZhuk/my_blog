class VotesController < ApplicationController
  
  before_filter :authorize_user
  
  def create
    vote = current_user.votes.create(permitted_params)
    votes = Vote.where(permitted_params).count
    article = vote.article
    flash["alert-success"] = 'Спасибо! Ваш голос учтен'
    redirect_to vote.article

  end


  def permitted_params
    params.permit(:article_id)
  end
end