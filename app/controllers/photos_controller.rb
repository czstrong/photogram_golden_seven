class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @show_photos = Photo.find_by({ :id => params["id"] })

  end

  def new_form

  end

  def create_row

    caption_new = params["the_caption"]
    image_url_new = params["the_source"]

    i = Photo.new
    i.source = image_url_new
    i.caption = caption_new
    i.save

    redirect_to("http://localhost:3000/photos")

  end

  def destroy

    i = Photo.find_by({ :id => params["id"] })
    i.destroy

    redirect_to("http://localhost:3000/photos")
  end

  def edit_form

    @photo = Photo.find_by({ :id => params["id"] })




  end

  def update_row

    p = Photo.find(params[:id])
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    redirect_to("http://localhost:3000/photos/#{p.id}")

  end


end
