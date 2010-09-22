module ApplicationHelper
  
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << "<div class='#{msg} flash'>#{html_escape(flash[msg.to_sym])}</div>" unless flash[msg.to_sym].blank?
    end
    flash.clear
    messages
  end
  
  def inside_layout(layout = 'application', &block) 
    render :inline => capture_haml(&block), :layout => "layouts/#{layout}" 
  end
  
  def yield_or_default(message, default_message = "")
    message.nil? ? default_message : message
  end
  
  def title(t)
    content_for :title do
      t
    end
  end   
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, :class => css_class
  end
  
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end  

  def add_google_map
    content_for :map do
      '<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>'
    end
  end
  
  def yes_no(b)
    b ? 'yes' : b.nil? ? '' : 'no'
  end

end
