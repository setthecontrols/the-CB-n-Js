get '/sessions/login' do
	erb :'sessions/new'
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if validation_fail
		erb :'/sessions/new'
	elsif @user
		login
		redirect "/"
	end
end

delete '/logout' do
	logout
	redirect '/'
end
