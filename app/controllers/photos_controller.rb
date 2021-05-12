class PhotosController < ApplicationController
  def index
   matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    
    render({ :template => "photos_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")
    @photo = Photo.where({ :id => url_id }).at(0)

    render({:template => "photos_templates/show.html.erb"})
  end

  def delete
   the_id = params.fetch("path_id")

   matching_photos = Photo.where({ :id => the_id })
   photo = matching_photos.at(0)
   photo.destroy

    #render({:template => "photos_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def create
    #Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id
    
    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)

    #render({:template => "photos_templates/create.html.erb"})
  end
end