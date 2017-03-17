# home page where there is a list of questions
get '/questions' do

  erb :index
end

# form page for creating new question
get '/questions/new' do
  @user = current_user.id
  erb :'/questions/new'
end

# create a new question
post '/questions' do
  if current_user
    @question = Question.new(params[:question])
    if @question.save
      redirect "/"
    else
      erb :'questions/new'
    end
  end
end

get "/questions/:id/answers/new" do
  @user = current_user
  @question_id = params[:id]
  erb :"answers/new"
end

post "/questions/:id" do
  @question = Question.find(params[:id])
  @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect "/questions/#{@question.id}"
    else
      erb :"answers/new"
    end
end

# display a specific question
get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.all


  erb :'/questions/show'
end

# form for editing a question
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end

# Update a specific question
put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'/questions/edit'
  end
end

# Delete a specific question
delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end


