class CommentsController < ApplicationController
  def create
   input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

   

    new_comment = Comment.new
    new_comment.author_id = input_author_id
    new_comment.photo_id = input_photo_id
    new_comment.body = input_body
    
    new_comment.save


    redirect_to("/photos/" + input_photo_id.to_s)
  end

end