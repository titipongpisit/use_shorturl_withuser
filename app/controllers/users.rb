enable :sessions

#GET =================================================================

get '/sign_up' do 
  erb :sign_up
end 

get '/logged_in' do 
  if session[:user]  
    erb :profile
  else
    redirect '/'
  end
end 

get '/sign_out' do 
  session.clear                 
  redirect '/'
end 

get '/profile' do 
  erb :profile
end 

#POST ===============================================================

post '/profilehey' do
  @url = Url.create(original_url: params[:url], short_url: Url.random, counter: 0, user_id: session[:user])
  redirect '/profile' 
end

post '/sign_up' do 
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_copy])
    if user.valid?
      session[:user] = user.id
      redirect '/logged_in'
    else 
      erb :sign_up_again
    end 
end 

post '/profile' do

 user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    puts user 
    if user  
      session[:user] = user.id 
      erb :profile
    else
      erb :sax_guy
    end
 
end

