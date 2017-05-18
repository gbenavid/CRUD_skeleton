get '/users' do
  @users = User.all 
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new' 
end

post '/users' do
  @user = User.new(params)
  if @user.save 
    login(@user)
    redirect "/users/#{@user.id}"
  else
    erb :'users/new' 
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show' 
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit' 
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  if @user.save 
    redirect '/users'
  else
    erb :'users/edit'
  end
end

delete '/users/:id' do
  @user = User.find(params[:id]) 
  @user.destroy 
  redirect '/users'
end
