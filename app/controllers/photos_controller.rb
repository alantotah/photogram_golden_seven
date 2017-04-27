class PhotosController < ApplicationController

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    photo = Photo.new
    photo.caption=params[:the_caption]
    photo.source=params[:the_source]
    photo.save

    redirect_to("/photos")
  end

  def index
    @list_of_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    @photo = Photo.find(params[:id])
    render("photos/show.html.erb")
  end

  def edit_form
    @photo = Photo.find(params[:id])
    render('photos/edit_form.html.erb')
  end

  def update_row
    photo = Photo.find(params[:id])
    photo.caption=params[:the_caption]
    photo.source=params[:the_source]
    photo.save

    redirect_to("/photos/#{photo.id}")
  end

  def destroy_row
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to("/photos")
  end

end
