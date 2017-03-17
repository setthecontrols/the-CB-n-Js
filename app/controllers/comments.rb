get "/answers/:id/comments/new" do
  @answer = Answer.find_by(id: params[:id])
  erb :"comments/new"
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
