# home page where there is a list of questions
get '/questions' do

  erb :index
end

# form page for creating new question
get '/questions/new' do
  erb :'/questions/new'
end

# create a new question
post '/questions' do
  if logged_in
    @question = Question.new(params[:question_text])
    if @question.save
      redirect "/questions"
    else
      erb :'questions/new'
    end
  end
end

# display a specific question
get '/questions/:id' do
  @question = Question.find(params[:id])
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


