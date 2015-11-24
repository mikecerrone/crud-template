#show all users
before do
  unless request.path_info == '/users/login' || request.path_info == '/' || request.path_info == '/posts' || request.path_info == '/session' || request.path_info == '/users/new'

   if session[:id] == nil
    redirect '/posts'
  end
 end
end



get '/posts' do
  @posts = Post.all
  erb :'/posts/posts_all'
end

#new user form
get '/posts/new' do
  erb :'/posts/posts_new', :layout => false
end

#create new user
post '/posts' do
  @post = Post.new(params)
  if @post.save
    redirect '/'
  else
    status 400
    flash[:errors] = @post.errors.full_messages
    redirect '/posts'
  end
end

#add a comment to a post
post '/posts/:id/comment' do
  @post = Post.find(params[:id])
  @comment = Comment.new(text: params[:text], post_id: @post.id, user_id: current_user.id)
  if @comment.save
    redirect "/posts/#{@post.id}"
  else
    puts 'ERROR'
  end
end


#get edit page
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'/posts/post_edit'
end

#show a user
get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :'/posts/post'
end





#submit user edit
put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update(params) #need to det up values in edit views

  # @post.title = params[:title]
  # @post.text = params[:text]
  # @post.user = params[:user] # not to be used

  if @post.save
    redirect '/'
  else
    flash[:errors] = @post.errors.full_messages
    redirect "/posts/#{@post.id}/edit"
  end
end

#delete user
delete '/posts/:id' do
  Post.find(params[:id]).destroy
  redirect "/"
end
