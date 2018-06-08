class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get  '/landmarks/new' do
    Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(:name => params[:landmark][:name], :year_completed => params[:landmark][:year_completed])
    #  @landmark.save
    redirect to '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    # model name followed by a method
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do    # get the line 19 for us
    @landmark = Landmark.find(params[:id])
    #  id helps to find by name instaed of ID
    erb :'/landmarks/edit'
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    # We can be spcific about what is changed rather than
    #   just "update"

    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]

    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end


end
