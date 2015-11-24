

########### CREATE NEW USER #############

#new user form
get '/users/new' do
	erb :'/users/user_new'
end

#create new user
post '/users' do
	user = User.new(username: params[:username], email: params[:email])
	user.password = params[:password]
	if user.save
		session[:id] = user.id
		redirect '/'
	else
		status 400
		flash[:errors] = user.errors.full_messages
		redirect '/users/new'
	end
end

########### USER EDIT #############

#get edit page
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'/users/user_edit'
end

#submit user edit
put '/users/:id' do
	user = User.find(params[:id])
	user.username = params[:username]
	user.email = params[:email]
	if user.save
		redirect '/'
	else
		flash[:errors] = user.errors.full_messages
		redirect "/users/#{current_user.id}/edit"
	end
end

########### LOGIN / LOGOUT #############

#user login form
get '/users/login' do
 erb :'/users/user_login'
end

#login user
post '/users/login' do
  @user = User.find_by_username(params[:username])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
end

#logout user
post '/users/:id' do
	session[:id] = nil
	current_user = nil
	redirect '/'
end


########### SHOW #############

#show a user
get '/users/:id' do
	@user = User.find(params[:id])
	@user_posts = @user.posts
	@user_comments = @user.comments
	erb :'users/user_profile'
end

#show all users
get '/users' do
	@users = User.all
	erb :'/users/user_index'
end

########### DELETE #############

#delete user
delete '/users/:id' do
	User.find(params[:id]).destroy
	session[:id] = nil
	current_user = nil
end


