class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
#    @story = Story.find(params[:story_id])
#    @micropost = @story.microposts.build(micropost_params)



    @micropost = current_user.microposts.build(params[:micropost_params])

#    @micropost = Micropost.new.(params[:micropost])
#    @micropost.story = @story   
#    @micropost.user = current_user

#    @micropost = current_user.microposts.build(micropost_params)
#     @micropost = @story.microposts.build(micropost_params)
#    @micropost.update_attribute(:story_id, @story.id) 
# I need to figure out how to pass the @story.id into here

    if @micropost.save
      flash[:success] = "Micropost created!"
#      redirect_to @story  # it wants to redirect to microposts, but that doesn't exist because it's embeded in stories

    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :story_id, :user_id)
    end
  
end