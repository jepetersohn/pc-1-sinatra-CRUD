get '/' do
  # Look in app/views/index.erb
  @note = Note.all
  erb :index
end

#create new note
post '/note' do
	Note.create(content: params[:note], title: params[:title])
	redirect "/"
end	

#update note
get '/note/:id' do
	@note = Note.find(params[:id])	
	erb :edit
end

put '/note/:id' do
	edit = Note.find(params[:id])
	edit.content = params[:content]
	edit.save 
	redirect '/'
end

#delete note
get '/note/:id/delete' do
	@note = Note.find(params[:id])
	erb :delete
end

delete '/note/:id/delete' do
	delete = Note.find(params[:id])
	delete.destroy
	redirect '/'
end