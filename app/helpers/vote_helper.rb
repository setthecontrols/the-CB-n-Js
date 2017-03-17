helpers do
  def upvote_answer
    @answer = Answer.find(params[:id])
    if @answer.votes.count == 0
      @answer.votes.create
    end
  end


  def upvote_question
    @question = Question.find(params[:id])
    p @question
    @question.votes.create(value: "updoot", user_id: @question.user_id)
    # if @question.votes.count == 0
    #   @question.votes.create
    # end
  end

  def points
    votes.count(:value)
  end
end
