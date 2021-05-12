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

  def update
   #Parameters: {"input_image"=>"https://robohash.org/errorexpeditacum.png?size=300x300&set=set1", "input_caption"=>"hihi", "path_id"=>"765"}
    
    the_id = params.fetch("path_id")
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    matching_photos = Photo.where({ :id => the_id }) 
    the_photo = matching_photos.first
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save
    
    redirect_to("/photos/"+ the_photo.id.to_s)

    #render({ :template => "photos_templates/update.html.erb" })
  end
end