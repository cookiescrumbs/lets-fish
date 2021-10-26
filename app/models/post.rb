class Post <  ActiveRecord::Base
  belongs_to :trip, touch: true

  has_attached_file :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def formated_time
    date.strftime("%I:%M %P")
  end

  def time_stamp
    DateTime.parse(date.to_s).to_i
  end

  def html_forecast  
    unless self.weather.empty? 
      w = JSON.parse(self.weather)
      w['html_forecast'] if w.key? 'html_forecast'
    end
  end
end
