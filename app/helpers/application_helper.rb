module ApplicationHelper
  def alert_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def gravatar_img(email)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    image_tag("http://gravatar.com/avatar/#{gravatar_id}.png?s=140", height: 50, height: 50)
  end
end
