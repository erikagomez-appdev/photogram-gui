class UsersController < ApplicationController
  def index
     matching_users = User.all
      @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "users_templates/index.html.erb" })
  end

  def show
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #if @the_user == nil
      #redirect_to("/404")
      #else 
      render({ :template => "users_templates/show.html.erb" })
    #end 
  end

  def create

    input_username = params.fetch("input_username")

    new_user = User.new 
    new_user.username = input_username
    new_user.save

    redirect_to("/users/"+ new_user.username.to_s)
  end


  def edit
    input_username = params.fetch("input_username")

    user_id = params.fetch("user_id")
    
    the_user = User.where({ :id => user_id }).first

    the_user.username = input_username

    the_user.save

    redirect_to("/users/"+ the_user.username.to_s)
  end

end