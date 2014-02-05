get '/' do
  erb :index
end

get '/notes' do
  @all_notes = Note.all
  erb :notes
end

get '/notes/new' do
	erb :new_note
end

post '/notes' do
	Note.create(params)
	redirect '/notes'
end

get '/notes/:id' do
	@note = Note.find(params[:id])
	erb :view_note
end

get '/delete/:id' do
	@note = Note.find(params[:id])
	erb :delete_note
end

delete '/notes/:id' do
	Note.destroy(params[:id])
	redirect '/notes'
end

get '/notes/:id/edit' do
	@note = Note.find(params[:id])
	erb :edit_note
end

put '/notes/:id' do
	note = Note.find(params[:id])
	note.content = params[:content]
	note.save
  redirect "/notes"
end