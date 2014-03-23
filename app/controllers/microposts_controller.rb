class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.update_attribute(:story_id, :id) 
# I need to figure out how to pass the @story.id into here

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
  
end