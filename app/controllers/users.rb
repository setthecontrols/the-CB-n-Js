
get '/users' do
	@users = User.all
	erb :index
end

get '/users/new' do
	erb :'/users/new'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		login
		redirect "/users/#{@user.id}"
	else
		erb :'/users/new'
	end
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])
	erb :'/users/show'
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
