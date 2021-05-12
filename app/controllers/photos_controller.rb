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
end