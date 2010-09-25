class PostsController < InheritedResources::Base
  belongs_to :user
end