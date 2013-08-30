
#Read
get '/' do
  #It’s important to use instance variables so that they’ll be accessible from within the view file.
  @notes = Note.order("id")
  @title = 'All Notes'
  erb :index
end

#Create
post '/' do
  n= Note.create( {title: params[:title], content: params[:content]})
  n.save
  redirect '/'
end

# session for anything used in different routes

# Update
# :id is a redirect from the 'href' in the view
get '/:id' do
  session[:note_id] = params[:id]
  @note = Note.find(params[:id])
  @title = "Edit note #{params[:id]}"
  erb :edit
end

# Update
put '/:id' do
  n = Note.find(params[:id])
  n.title = params[:title]
  n.content = params[:content]
  n.save
  redirect '/'
end

# Verify deletion request
get '/delete' do
  @note = Note.find(session[:note_id])
  @title = "Confirm deletion of note #{params[:id]}"
  erb :delete
end

# Delete
delete '/:id/delete' do
  @note = Note.find(params[:id])
  @note.destroy
  # @note[:title].destroy
  redirect '/'
end