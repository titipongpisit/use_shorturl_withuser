
post '/' do 
  short = Url.random
  @url = Url.create(original_url: params[:original_url], short_url: short, counter: 0)
  if @url.valid?
  erb :newurl 
  else
  erb :notvalid 
  end 
end 
