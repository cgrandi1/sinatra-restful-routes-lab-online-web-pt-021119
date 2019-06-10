class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
     @recipes = Recipe.all
     erb :index
   end

   get '/recipes/new' do
     @recipes = Recipe.all
     
     erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

   get '/recipes/:id' do
    #  binding.pry
     @recipe = Recipe.find_by(params[:id])

     erb :show
   end

  #  post '/recipes' do
  #    @recipe = Recipe.new
  #    @recipe.save
   #
  #    redirect to "/recipes/#{@recipe.id}"
  #  end

   get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(params[:id])
     erb :edit
   end

   patch '/recipes/:id' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.name = params[:name]
     @recipe.ingredients = params[:ingredients]
     @recipe.cook_time = pararms[:cook_time]
     @recipe.save
    redirect to "/recipes/#{@recipe.id}"
   end

  delete '/recipes/:id' do
    @recipe= Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
