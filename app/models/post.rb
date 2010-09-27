class Post < ActiveRecord::Base
  auto_html_for :body do
    sanitize
    html_escape
    image
    red_cloth
    youtube(:width => 600, :height => 450)
    vimeo(:width => 600, :height => 450)
    dailymotion(:width => 600, :height => 450)
    google_video
    link :target => "_blank", :rel => "nofollow"
  end

  belongs_to :company
  validates_presence_of :title
  
  scope :forward,  order('created_at ASC')
  scope :backward, order('created_at DESC')  
  scope :pending, where('published_on is NULL')
  scope :published, where('published_on is not NULL')
  
  belongs_to :user
end
