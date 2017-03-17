helpers do
  def upvote_answer
    @answer = Answer.find(params[:id])
    @answer.votes.create(value: "updoot", user_id: @answer.user_id)
  end

  def upvote_question
    @question = Question.find(params[:id])
    @question.votes.find_or_create_by(value: "updoot", user_id: @question.user_id)
  end

  def downvote_question
    @question = Question.find(params[:id])
    @question.votes.find_or_create_by(value: "downdoot", user_id: @question.user_id)
  end

  def downvote_answer
    @answer = Answer.find(params[:id])
    @answer.votes.find_by(user_id: params[:id]).delete
  end

  def count_votes(args)
    updoots = 0
    downdoots = 0
    args.votes.each do |vote|
      if vote.value == "updoot"
        updoots += 1
      elsif vote.value == "downdoot"
        updoots -= 1
      end
    end
    return updoots
  end

end
