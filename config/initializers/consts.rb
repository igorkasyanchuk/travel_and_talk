GOOGLE_KEYS = {
  "development" => "ABQIAAAA-fvnmbkR8BJ_xVoxel7PfhSvcDMizmiBvzrB1F5eJeU6gK2K7RQW3Pfw8DmhMhUuewSuQjcD20SoUA",
  "test" => "ABQIAAAA-fvnmbkR8BJ_xVoxel7PfhSvcDMizmiBvzrB1F5eJeU6gK2K7RQW3Pfw8DmhMhUuewSuQjcD20SoUA",
  "production" => ""
}

STATES = [:alabama, :alaska, :arizona, :arkansas,
          :california, :colorado, :connecticut,
          :delaware, :florida, :georgia, :hawaii, :idaho,
          :illinois, :indiana, :iowa, :kansas,
          :kentucky, :louisiana, :maine, :maryland,
          :massachusetts, :michigan, :minnesota, :mississippi,
          :missouri, :montana, :nebraska, :nevada,
          :new_hampshire, :new_jersey, :new_mexico,
          :new_york, :north_carolina, :north_dakota,
          :ohio, :oklahoma, :oregon, :pennsylvania,
          :rhode_island, :south_carolina, :south_dakota,
          :tennessee, :texas, :utah, :vermont, :virginia,
          :washington, :west_virginia, :wisconsin, :wyoming].collect{|e| e.to_s.camelize.titleize }
          
          
AutoHtml.add_filter(:red_cloth) do |text|
  RedCloth.new(text).to_html
end
          