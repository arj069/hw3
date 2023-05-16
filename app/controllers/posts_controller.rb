class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new 
    @place = Place.find_by({"name"=>params["id"]})
    @post["place_id"] = @place["id"]
  end

  def create
    @post = Post.new 
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["date"]
    @post.save
    redirect_to "/places"
  end

end
