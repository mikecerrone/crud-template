# get '/comments' do
#   @comments = Comments.all
#   erb :'/comments/comments_all'
# end

# #new user form
# get '/comments/new' do
#   erb :'/comments/comments_new'
# end

# #create new user
# post '/comments' do
#   @comment = Comment.new(params)
#   if @comment.save
#     redirect '/'
#   else
#     status 400
#     flash[:errors] = @comment.errors.full_messages
#     redirect '/comments'
#   end
# end

# #get edit page
# get '/comments/:id/edit' do
#   @comment = Comment.find(params[:id])
#   erb :'/comments/post_edit'
# end

# #show a user
# get '/comments/:id' do
#   @comment = Comment.find(params[:id])
# end

# #submit user edit
# put '/comments/:id' do
#   @comment = Comment.find(params[:id])
#   @comment.update(params) #need to det up values in edit views
#   # @comment.text = params[:text]
#   # @comment.user = params[:user] # not to be used

#   if @comment.save
#     redirect '/'
#   else
#     flash[:errors] = @comment.errors.full_messages
#     redirect "/comments/#{@comment.id}/edit"
#   end
# end

# #delete user
# delete '/comments/:id' do
#   Comment.find(params[:id]).destroy
# end

