get "/answers/:id/comments/new" do
  @answer = Answer.find_by(id: params[:id])
  erb :"comments/new"
end
# fff
get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])
  erb :'comments/question_comment_new'
end

post "/questions/:id/comments" do
  @question = Question.find_by(id: params[:id])
  @comment = @question.comments.new(params[:comment])
  @comment.user_id = current_user.id

  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'comments/question_comment_new'
  end

end

post '/answers/:answer_id' do
  p '*'*40
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = @answer.comments.new(params[:comment])
  @user = current_user.id
  @comment.user_id = @user
  if @comment.save
    redirect "/questions/#{@answer.question_id}"
  else
    erb :'comments/new'
  end


end
