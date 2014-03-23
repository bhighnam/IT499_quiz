class Story < ActiveRecord::Base
  has_many :microposts

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("story_id = ?", id)
  end

end
