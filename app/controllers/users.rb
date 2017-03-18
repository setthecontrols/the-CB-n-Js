
get '/users' do
	@users = User.all
	erb :index
end

get '/users/new' do
	erb :'/users/new'
end

post '/users' do
	@user = User.new(params[:user])
	p "*"*50
	p params
	if params[:user][:password] != "" && @user.save
		login
		redirect "/"
	else
		p "*8*8*"*40
		p @errors = @user.errors.full_messages
		erb :'/users/new'
	end
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])
	@questions = Question.where(user_id: @user.id)
	@answers = Answer.where(user_id: @user.id)
	if @user.valid
		erb :'/users/show'
	else
		redirect :'/users/login'
	end
end


get '/users/:id/edit' do
	@user = User.find_by(id: params[:id])
	erb :'/users/edit'
end

put '/users/:id' do
	@user = User.find_by(id: params[:id])
	@user.assign_attributes(params[:user])
	if @user.save
		redirect '/users'
	else
		erb :'/users/edit'
	end
end

delete '/users/:id' do
	@user.destroy
	redirect '/'
end
