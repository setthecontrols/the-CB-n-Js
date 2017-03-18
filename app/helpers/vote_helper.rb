helpers do
  def upvote_answer
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.find_by(user_id: current_user.id)
    if @vote
      @vote.update_attributes(value: "updoot")
    else
      Vote.create(value: "updoot", user_id: current_user.id, votable_id: @answer.id, votable_type: "Answer")
    end
  end

  def upvote_question
    @question = Question.find(params[:id])
    @vote = @question.votes.find_by(user_id: current_user.id)
    if @vote
      @vote.update_attributes(value: "updoot")
    else
      Vote.create(value: "updoot", user_id: current_user.id, votable_id: @question.id, votable_type: "Question")
    end
  end

  def downvote_question
    @question = Question.find(params[:id])
    @vote = @question.votes.find_by(user_id: current_user.id)
    if @vote
      @vote.update_attributes(value: "downdoot")
    else
      Vote.create(value: "downdoot", user_id: current_user.id, votable_id: @question.id, votable_type: "Question")
    end
  end

  def downvote_answer
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.find_by(user_id: current_user.id)
    if @vote
      @vote.update_attributes(value: "downdoot")
    else
      Vote.create(value: "downdoot", user_id: current_user.id, votable_id: @answer.id, votable_type: "Answer")
    end
  end

  def count_votes(args)
    counter = 0
    args.votes.each do |vote|
      if vote.value == "updoot"
        counter += 1
      elsif vote.value == "downdoot"
        counter -= 1
      end
    end
    return counter
  end

end
